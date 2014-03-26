require 'spec_helper'

describe TimeTrap do
  let(:ttrap) { TimeTrap.new }

  context "#add" do
    it "allows values to be added" do
      ttrap.add("test_1")
      expect(ttrap.count).to eq(1)
    end

    it "allows values to be added with a timestamp" do
      t = Time.now.to_i - 1000
      ttrap.add("test_1", t)
      expect(ttrap.get("test_1")).to match_array([t])
    end
  end

  context "#count" do
    it "keeps count of objects added" do
      time = ttrap.add("test_1")
      expect(ttrap.count).to eq(1)
      expect(ttrap.get("test_1").first).to eq(time)
      expect(ttrap.get("test_1").last).to eq(time)
    end
  end

  context "#has_key?" do
    it "checks on added keys" do
      ttrap.add("test_1")
      expect(ttrap.has_key?("test_1")).to eq(true)
    end

    it "checks on missing keys" do
      expect(ttrap.has_key?("test_1")).to eq(false)
    end
  end

  context "#keys" do
    it "returns array of added keys" do
      ttrap.add("test_1")
      ttrap.add("test_2")
      expect(ttrap.keys).to match_array(["test_1", "test_2"])
    end
  end

  context "#each" do
    it "allows block code to be run on each key" do
      (1..3).each {|i| ttrap.add("test_#{i}")}
      cnt = 0
      ttrap.each {|key, val| cnt += 1}
      expect(cnt).to eq(3)
    end
  end
    
  context "#delete_if" do
    it "allows block code to be run on each key" do
      (1..3).each {|i| ttrap.add("test_#{i}")}
      ttrap.delete_if {|key, val| key == "test_1"}
      expect(ttrap.keys.count).to eq(2)
    end
  end
    
  context "#sort_by" do
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

  context "#top_x" do
    it "gives you the top values sorted by code block" do
      (0..0).each {|i| ttrap.add("1")}
      (0..1).each {|i| ttrap.add("2")}
      (0..2).each {|i| ttrap.add("3")}
      arr = ttrap.top_x(1)
      expect(arr).to match_array(["3"]) 
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
end
