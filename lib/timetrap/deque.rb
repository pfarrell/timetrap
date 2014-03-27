# Deque is an inplementation of a [double ended queue] (https://en.wikipedia.org/wiki/Double-ended_queue)
# currently implemented using an array
class Deque
  attr_accessor :queue

  def initialize
    @queue = []
  end

  # @return [Object] return earliest object added
  def first
    return @queue.last
  end

  # @return [Object] return most recent object added
  def last
    return @queue.first
  end
  
  # @param [FixNum] time time value to pushed into queue
  def push(time=Time.now.to_i)
    @queue << time
    return time
  end

  # @return [FixNum] return most recent time added
  def pop
    return @queue.shift
  end

  # @return [FixNum] return count of objects in queue
  def count
    return @queue.size
  end

  # @param [FixNum] start_time beginning of time range for window
  # @param [FixNum] end_time end of time range for window
  # @return [Array] returns array of time entries contained in window
  def window(start_time, end_time)
    ret = @queue.select {|data_time| data_time >= start_time && data_time <= end_time }
    return ret
  end

end

