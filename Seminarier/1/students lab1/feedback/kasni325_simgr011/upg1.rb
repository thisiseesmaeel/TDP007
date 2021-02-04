def n_times (n, &block)
  for i in 1..n do
    block.call
  end
end

class Repeat
  def initialize(times)
    @times = times
  end

  def each(&block)
    n_times(@times) {block.call}
  end
end
