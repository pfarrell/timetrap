require 'spec_helper'


describe Deque do

  let(:deque) { Deque.new }
  context "#initialize" do
    it "has zero count" do
      expect(deque.count).to  eq(0)
    end
  end

  context "#count" do
    it "has correct count" do
      (1..100).each {|i| deque.push }
      expect(deque.count).to eq(100)
    end

    it "gets incremented" do
      deque.push
      expect(deque.count).to eq(1)
    end

    it "gets decremented" do
      deque.push
      deque.pop
      expect(deque.count).to eq(0)
    end

    it "stays positive" do
      (1..100).each {|i| deque.pop }
      expect(deque.count).to eq(0)
    end
  end
    
  context "#push" do
    it "can push to new deque" do
      deque.push
      expect(deque.count).to eq(1)
    end
  end

  context "#pop" do
    it "doesn't blow up popping null" do
      deque.pop
    end

    it "keeps things FIFO order" do
    end
  end

  context "#first" do
    it "lets you peek at the first element" do
      (1..3).each {|i| deque.push }
      deque.push(12345)
      expect(deque.first).to eq(12345)
    end
  end

  context "#last" do
    it "lets you peek at the last element" do
      deque.push(12345)
      (1..3).each {|i| deque.push }
      expect(deque.last).to eq(12345)
    end
  end

  context "#window" do
    it "returns windowed counts" do
      t = Time.now.to_i
      arr = []
      arr << deque.push(t-1)
      arr << deque.push(t)
      expect(deque.window(t - 120, t - 60 )).to eq([])
      expect(deque.window(t - 60, t)).to match_array(arr)
    end
  end
end
