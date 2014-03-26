class TimeTrap
  include Enumerable

  def initialize
    @tt = {}
  end

  def add(value, time=Time.now.to_i)
    @tt[value] ||= Deque.new
    return @tt[value].push(time)
  end

  def get(value)
    return @tt[value].queue
  end

  def keys
    return @tt.keys
  end

  def each(&block)
    @tt.each(&block)
  end

  def delete_if(&block)
    @tt.delete_if(&block)
  end

  def sort_by(&block)
    @tt.sort_by(&block)
  end

  def top(rank) 
    ret = @tt.sort_by {|k,v| -v.count}.map{|k,v| k}
    return ret[0..rank - 1]
  end

  def last(secs)
    t = Time.now.to_i
    return window(t - secs, t)
  end 

  def has_key?(key)
    return @tt.has_key?(key)
  end

  def count
    return @tt.count
  end

  def window(start_sec, end_sec) 
    ret = {}
    @tt.each {|k,v| ret[k] = v.window(start_sec, end_sec).count if v.window(start_sec, end_sec).count > 0}
    return ret
  end
end
