class Integer
  def fib(n = self)
    if n == 0
      return 0
    elsif n <= 1
      return 1
    else
      return fib(n - 1) + fib(n - 2)
    end
  end
end
