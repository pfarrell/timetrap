class Deque

  def initialize
    @queue = []
  end

  def first
    return @queue.last
  end

  def last
    return @queue.first
  end

  def push(time=Time.now.to_i)
    @queue << time
    return time
  end

  def pop
    return @queue.shift
  end

  def count
    return @queue.size
  end

  def window(window_length, start_time=Time.now.to_i)
    ret = @queue.select {|data_time| start_time - data_time >= 0 && start_time - data_time <= window_length }
    return ret
  end

end

