class Integer
  def fib
    if self == 1 or self == 2
      1
    else
      (self-1).fib + (self-2).fib
    end
  end
end
