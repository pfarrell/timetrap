class DEQueue
  attr :head, :tail

  def initialize
    @count= 0
  end

  def push
    node = Node.new
    @head.prepend(node) unless @head.nil?
    @head = node
    @tail ||= node 
    increment
    return node
  end

  def pop
    return nil if count== 0
    ret = @tail
    @tail = @tail.prev
    decrement
  end

  def count
    return @count
  end

  private
  def increment
    @count += 1  
  end

  def decrement
    @count -= 1
  end
end

