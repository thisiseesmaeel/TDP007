# Iterator function
def n_times(count, &block)
  count.times do block.call end
end

# Iterator class
class Repeat
  def initialize(count)
    @n = count
  end

  def each(&block)
    @n.times do block.call end
  end
end


