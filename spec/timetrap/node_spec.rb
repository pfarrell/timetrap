require 'spec_helper'

describe Node do
  it { should respond_to :prev }
  it { should respond_to :next }
  it { should respond_to :genesis }

  let(:node) { Node.new() }

  describe "#expired?" do

    context "not expired" do
      it "returns false" do
        expect(node.expired?(3600, node.genesis + 3599)).to eq(false)
      end
    end

    context "expired" do
      it "returns true" do
        expect(node.expired?(3600, node.genesis + 3601)).to eq(true)
      end
    end
  end

  describe "#prepend" do
    it "allows nodes to be prepended" do
      node1 = Node.new
      node.prepend(node1)
      expect(node1.next).to eq (node)
    end
  end
end
