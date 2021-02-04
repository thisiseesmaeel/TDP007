#!/bin/env ruby
require 'date'

#upg 1
def n_times(n, &block)
  counter = 0
  while counter < n do
    block.call()
    counter += 1
  end
end

class Repeat
  def initialize(n)
    @number = n
  end
  def each(&block)
    counter = 0
    while counter < @number
      block.call()
      counter += 1
    end
  end
end


#upg 2
#puts((1..20).inject(:*))
def factorial(n)
  if n < 0
    return false
  end
  if n == 0
    return 1
  else
    return (1..n).inject(:*)
  end
end

#upg 5
class PersonName

  attr_accessor :name, :surname
    
  def initialize(name, surname)
    @name = name
    @surname = surname
  end
  def fullname
    "#{surname} #{name}"
  end
  def fullname=(fullname)
    @name = fullname.split()[0]
    @surname = fullname.split()[1]
  end
end

#upg6
class Person
  
  attr_accessor :age, :birthyear, :name
  
  def initialize(age, name, surname)
    @age = age
    @birthyear = (DateTime.now.year) - age
    @name = PersonName.new(name, surname)
  end
  def age=(age)
    @age=age
    @birthyear = (DateTime.now.year) - age
  end
  def birthyear=(birthyear)
    @birthyear = birthyear
    @age = (DateTime.now.year) - birthyear
  end
end

#upg 7
class Integer
  def fib
    return false if self < 0
    return self if self < 2
    return (self-1).fib + (self-2).fib
  end
end

#upg 8
class String
  def acronym
    list = self.split()
    acro = ""
    for word in list
      acro += word[0].capitalize()
    end
    return acro
  end
end


#upg 10
def find_username(string)
  username = string.sub(/[a-zA-Z]*: /, '')
  return username
end




#upg 12
def regnr(string)
  if string.match(/[A-Z&&[^IQV]]{3}\d{2}(\d|[A-Z&&[^O]])/)
    return string[/[A-Z&&[^IQV]]{3}\d{2}(\d|[A-Z&&[^O]])/]
  else
    return false
  end
end

