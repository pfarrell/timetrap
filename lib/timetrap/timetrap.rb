class TimeTrap
  include Enumerable

  def initialize
    @tt = {}
  end

  def add(value)
    @tt[value] ||= Deque.new
    return @tt[value].push
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

  def has_key?(key)
    return @tt.has_key?(key)
  end

  def count(value, window_sec=3600)
    return @tt[value].count
  end

end
