class Integer
  def fib()
    index = 0
    num1, num2 = 1, 1

    
    while (self > index)
      temp = num1
      num1 = num1 + num2
      num2 = temp
      index += 1
    end

    num1
  end
end


#p 10.fib
