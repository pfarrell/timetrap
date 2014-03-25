require 'spec_helper'


describe Deque do
  it { should respond_to :count }
  it { should respond_to :head }
  it { should respond_to :tail }

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

  context "#window" do
    it "returns windowed counts" do
      deque.push
      deque.push
      expect(deque.window(-1)).to eq(0)
      expect(deque.window(25)).to eq(2)
    end
  end
end
