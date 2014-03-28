require 'spec_helper'

describe TimeTrap do
  let(:ttrap) { TimeTrap.new }

  context "#add" do
    it "returns the time_added in seconds since epoch" do
      t = Time.now.to_i
      expect(ttrap.add("test_1")).to be_a(Fixnum) 
      expect(ttrap.add("test_1")).to eq(t)
    end
    
    it "allows values to be added" do
      ttrap.add("test_1")
      expect(ttrap.count).to eq(1)
    end

    it "allows values to be added with a timestamp" do
      t = Time.now.to_i - 1000
      ttrap.add("test_1", t)
      expect(ttrap.get("test_1")["test_1"]).to match_array([t])
    end
  end

  context "#get" do
    it "returns a hash" do
      ttrap.add("test_1")
      expect(ttrap.get("test_1")).to be_a(Hash)
    end

    it "allows retrieval of values" do
      t = Time.now.to_i
      ttrap.add("test_1", t)
      expect(ttrap.get("test_1")["test_1"]).to match_array([t])
    end
                                      
    it "returns nil for keys that haven't been added" do
      expect(ttrap.get("test_1")).to be_nil
    end
  end

  context "#count" do
    it "returns a Fixnum" do
      ttrap.add("test_1")
      expect(ttrap.count).to be_a(Fixnum)
    end

    it "keeps count of objects added" do
      time = ttrap.add("test_1")
      expect(ttrap.count).to eq(1)
      expect(ttrap.get("test_1")["test_1"].first).to eq(time)
      expect(ttrap.get("test_1")["test_1"].last).to eq(time)
    end
  end

  context "#has_key?" do
    it "returns a bool" do
      ttrap.add("test_1")
      expect(ttrap.has_key?("test_1")).to be_a(TrueClass)
      expect(ttrap.has_key?("test_2")).to be_a(FalseClass)
    end
    
    it "checks on added keys" do
      ttrap.add("test_1")
      expect(ttrap.has_key?("test_1")).to eq(true)
    end

    it "checks on missing keys" do
      expect(ttrap.has_key?("test_1")).to eq(false)
    end
  end

  context "#keys" do
    it "returns an array" do
      ttrap.add("test_1")
      expect(ttrap.keys).to be_an(Array)
    end

    it "returns array of added keys" do
      ttrap.add("test_1")
      ttrap.add("test_2")
      expect(ttrap.keys).to match_array(["test_1", "test_2"])
    end
  end

  context "#each" do
    it "is an enumerator" do
      expect(ttrap.each).to be_an(Enumerator)
    end

    it "allows block code to be run on each key" do
      (1..3).each {|i| ttrap.add("test_#{i}")}
      cnt = 0
      ttrap.each {|key, val| cnt += 1}
      expect(cnt).to eq(3)
    end
  end
    
  context "#delete_if" do
    it "is an enumerator" do
      expect(ttrap.each).to be_an(Enumerator)
    end

    it "allows block code to be run on each key" do
      (1..3).each {|i| ttrap.add("test_#{i}")}
      ttrap.delete_if {|key, val| key == "test_1"}
      expect(ttrap.keys.count).to eq(2)
    end
  end
    
  context "#sort_by" do
    it "is an enumerator" do
      expect(ttrap.each).to be_an(Enumerator)
    end

    it "allows access to keys sorted by output of block code" do
      (0..0).each {|i| ttrap.add("1")}
      (0..1).each {|i| ttrap.add("2")}
      (0..2).each {|i| ttrap.add("3")}
      arr = ttrap.sort_by{|k,v| -v.count}
      expect(arr[0][0]).to eq("3")
      expect(arr[1][0]).to eq("2")
      expect(arr[2][0]).to eq("1")
    end
  end

  context "#top" do
    it "returns a TimeTrap" do
      ttrap.add("test_1")
      expect(ttrap.top(1)).to be_a(TimeTrap)
    end

    it "gives you the top values sorted by code block" do
      (0..0).each {|i| ttrap.add("1")}
      (0..1).each {|i| ttrap.add("2")}
      (0..2).each {|i| ttrap.add("3")}
      expect(ttrap.top(1).count).to eq(1)
      expect(ttrap.top(1).get("3")["3"].count).to eq(3)
    end
  end

  context "#window" do
    it "allows retrieves of key counts over a window of time" do
      t = Time.now.to_i
      (0..9).each {|i| ttrap.add(i)}
      expect(ttrap.window(t - 60, t).size).to eq(10)
    end

    it "allows retrieves of key counts ignoring expired ones" do
      t = Time.now.to_i
      (0..9).each{|i| ttrap.add(i, t - 61)}
      expect(ttrap.window(t - 60, t).size).to eq(0)
    end
  end

  context "#last" do
    it "gives last day's worth of data" do
      t = Time.now.to_i
      (0..9).each{|i| ttrap.add(i, t - 60*60*24 - 1)}
      (10..19).each{|i| ttrap.add(i, t) }
      expect(ttrap.last(60*60*24).keys).to match_array((10..19).to_a)
    end

    it "gives last hour's worth of data" do
      t = Time.now.to_i
      (0..9).each{|i| ttrap.add(i, t - 60*24 - 1)}
      (10..19).each{|i| ttrap.add(i, t) }
      expect(ttrap.last(60*24).keys).to match_array((10..19).to_a)
    end

    it "gives last minute's worth of data" do
      t = Time.now.to_i
      (0..9).each{|i| ttrap.add(i, t - 60 - 1)}
      (10..19).each{|i| ttrap.add(i, t) }
      expect(ttrap.last(60).keys).to match_array((10..19).to_a)
    end
  end
end
