require 'spec_helper'


describe DEQueue do
  it { should respond_to :count }
  it { should respond_to :head }
  it { should respond_to :tail }

  let(:dequeue) { DEQueue.new }
  context "#initialize" do
    it "has zero count" do
      expect(dequeue.count).to  eq(0)
    end
  end

  context "#count" do
    it "has correct count" do
      (1..100).each {|i| dequeue.push }
      expect(dequeue.count).to eq(100)
    end

    it "gets incremented" do
      dequeue.push
      expect(dequeue.count).to eq(1)
    end

    it "gets decremented" do
      dequeue.push
      dequeue.pop
      expect(dequeue.count).to eq(0)
    end

    it "stays positive" do
      (1..100).each {|i| dequeue.pop }
      expect(dequeue.count).to eq(0)
    end
  end
    
  context "#push" do
    it "can push to new dequeue" do
      dequeue.push
      expect(dequeue.count).to eq(1)
    end
  end

  context "#pop" do
    it "doesn't blow up popping null" do
      dequeue.pop
    end

    it "keeps things FIFO order" do
    end

  end
end
