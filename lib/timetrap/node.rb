class Node
  attr_accessor :prev, :next, :genesis

  def initialize
    @genesis = Time.now.to_i
  end

  def expired?(lifetime, seconds)
    return seconds - @genesis > lifetime 
  end

  def prepend(node)
    node.next = self
    @prev = node
  end

end
