require 'date'
# 1
def n_times(n, &block)
  for i in 1..n
    block.call()
  end
end

class Repeat
  def initialize(i)
    @i = i
  end

  def each(&block)
    for j in 1..@i
      block.call()
    end
  end
end

# 3
def find_longest(s_array)
  longest = ""
  s_array.each do | e |
    if e.length > longest.size
      longest = e
    end
  end
  longest
end

# 5
class PersonName
  def initialize(name, surname)
    @name = name
    @surname = surname
  end
  def fullname 
    @name + " " + @surname 
  end
  
  def fullname= fullname
    @name = fullname.split[0]
    @surname = fullname.split[1]
  end
end

# 6 
class Person
  def initialize(age = 0, first_name = "" , last_name = "")
    @age = age
    @name = PersonName.new(first_name, last_name)
    @birthyear = calc_birthyear age
  end

  def name
    @name.fullname
  end

  def age
    @age
  end

  def age= age
    @age = age
    @birthyear = calc_birthyear age
  end

  def birthyear
    @birthyear
  end

  def birthyear= birthyear
    @birthyear = birthyear
    @age = DateTime.now.year - birthyear
  end

  private
  def calc_birthyear age
    DateTime.now.year - age
  end
end

#7
class Integer
  def fib
    if self < 3
      return 1
    else 
      return (self-1).fib + (self-2).fib
    end
  end
end

# 8
class String
  def acronym
    ret_string = ""
    self.split.each { | s | ret_string << s[0] }
    ret_string.upcase
  end
end

# 10
def find_username line
  match = /(^[a-zA-Z]*: )(.*)/.match(line)
  if match
    match[2]
  end
end

# 12
def regnr n
  match = /[A-Z]{3}\d{3}/.match n
  if match
    match.to_s
  else
    false
  end
end