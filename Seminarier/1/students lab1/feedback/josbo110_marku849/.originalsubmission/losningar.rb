#Avsnitt 1

#Uppgift 1
def n_times(n, &block)
  while (n > 1)
    n -= 1
    block.call
  end
  yield
end

class Repeat
  def initialize(n)
    @n = n
  end
  def each
    i = 1
    loop do
      break i if (i == @n)
      i += 1
      yield
    end
    yield
  end
end

#Uppgift 3
def longest_string(array)
  @longest = Array[0]
  for string in array do
    if (string.length > @longest.length)
      @longest = string
    end
  end
  @longest
end

#Avsnitt 2

#Uppgift 5
class PersonName
  attr_reader :first_name, :last_name
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end
  def full_name
    @first_name + " " + @last_name
  end
  def full_name=(full_name)
    name_Array = full_name.split
    @first_name = name_Array[0]
    @last_name = name_Array[1]
  end
end

#Uppgift 6
class Person
  attr_reader :age, :birth_year, :first_name, :last_name
  def initialize(age, name)
    require 'date'
    date = Date.new(2021)
    @year = date.year
    @age = age
    @birth_year = @year - @age
    @first_name = name.first_name
    @last_name = name.last_name
  end
  def age=(new_age)
    @age = new_age
    @birth_year = @year - @age
  end
  def birth_year=(new_birth_year)
    @birth_year = new_birth_year
    @age = @year-@birth_year
  end
end

#Avsnitt 3

#Uppgift 7

class Integer
  def fib
    (self - 1 + self - 2)
  end
end

#Upppgift 8
class String
  def acronym
    string_Array = self.split(" ")
    acr = ""
    for word in string_Array do
      acr += word[0].upcase
    end
    acr
  end
end

#Avsnitt 4

#Uppgift 10
def regname(input)
  input.gsub(/\D*: /, "")
end

#Uppgift 12
def regnr(input)
  input = input.scan(/[A-Z]{3}\d{3}/)
  if (input[0].match(/[IQV]/) != nil)
    input = []
  end
  if (input.length == 1)
    input[0]
  else
    "false"
  end
end
#regnr("Min bil heter FMA297.")
#regnr("Min bil heter FMI297.")
