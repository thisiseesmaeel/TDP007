#! usr/bin/env ruby
require 'date'

#U5
class PersonName
  attr_accessor :name, :surname
  def initialize(name, surname)
    @name = name
    @surname = surname
  end
  def fullname
    "#{@surname} #{@name}"
  end
  def fullname=(str)
    @name = str.split[0]
    @surname = str.split[1]
  end
end

#U6
class Person
  attr_accessor :age, :birthyear, :name
  def initialize(name = "Karl", surname = "Karlsson", age = 0)
    @age = age
    @birthyear = DateTime.now.to_date.year - age
    @name = PersonName.new(name, surname)
  end
  def birthyear=(year)
    @birthyear = year
    @age = DateTime.now.to_date.year - birthyear
  end
  def age=(age)
    @age = age
    @birthyear = DateTime.now.to_date.year - age
  end
end
