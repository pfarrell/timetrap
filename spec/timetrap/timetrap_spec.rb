require 'spec_helper'

describe TimeTrap do
  let(:ttrap) { TimeTrap.new }

  context "#add" do
    it "allows values to be added" do
      ttrap.add("test_1")
      expect(ttrap.count("test_1")).to_not be_nil
    end
  end

  context "#count" do
    it "keeps count of objects added" do
      ttrap.add("test_1")
      expect(ttrap.count("test_1")).to eq(1)
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
    
end
