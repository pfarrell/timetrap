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

  def window(length_sec)
    t = Time.now.to_i
    cnt = 0
    node = @head
    while (!node.nil? && t - node.genesis <= length_sec)
      cnt += 1
      node = node.next
    end
    return cnt
  end

  private
  def increment
    @count += 1  
  end

  def decrement
    @count -= 1
  end
end

