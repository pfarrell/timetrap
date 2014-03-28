
# TimeTrap is a data structure that allows stores instances of keys added over time.
# At its core, TimeTrap is a hash where keys are data instances tracked and values are 
# arrays of time(s) when teh data instance occurred.

class TimeTrap
  include Enumerable

  def initialize
    @tt = {}
  end

  # Add an instance of value to timetrap. time defaults to seconds since
  # epoch unless you provide a value.
  def add(value, time=Time.now.to_i)
    @tt[value] ||= Deque.new
    return @tt[value].push(time)
  end

  # @param [Object] value key to retrieve. 
  # @return [Hash] key = value, value = array of time entries.  nil if missing
  def get(value)
    ret = @tt[value].nil? ? nil : {value => @tt[value].queue}
    return ret
  end

  # @return [Array] array of values that have been added
  def keys
    return @tt.keys
  end

  # allows block code to be run on each entry in TimeTrap
  def each(&block)
    @tt.each(&block)
  end

  # removes k/v from TimeTrap if block code evaluates to true
  # @return [TimeTrap] TimeTrap instance with deleted entries removed
  def delete_if(&block)
    @tt.delete_if(&block)
  end
  
  # @return [Array] of values sorted by argued block code
  def sort_by(&block)
    @tt.sort_by(&block)
  end

  # @param [Fixnum] rank number of entries to return
  # @return [Array] array of keys sorted by number of instances
  def top(rank) 
    ret = @tt.sort_by {|k,v| -v.count}.map{|k,v| k}
    return ret[0..rank - 1]
  end

  # @param [Fixnum] secs number of seconds before current time for window
  # @return [Hash] returns hash of values in window key=added data, value = count 
  # of occurences in last argued secondswindow 
  def last(secs)
    t = Time.now.to_i
    return window(t - secs, t)
  end 

  # @param [Object] key key to look up in TimeTrap
  # @return [bool] obvious??
  def has_key?(key)
    return @tt.has_key?(key)
  end

  # @return count of distinct keys which have been added
  def count
    return @tt.count
  end

  # @param [FixNum] start_sec beginning on time frame
  # @param [FixNum] end_sec end of time frame
  # @return [Hash] key = value added to TimeTrap, value = count of instances in the window
  def window(start_sec, end_sec) 
    ret = {}
    @tt.each {|k,v| ret[k] = v.window(start_sec, end_sec).count if v.window(start_sec, end_sec).count > 0}
    return ret
  end
end

require 'timetrap/deque'
