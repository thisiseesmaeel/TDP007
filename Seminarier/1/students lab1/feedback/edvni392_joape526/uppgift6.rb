require './uppgift5.rb'
require 'date'

class Person < PersonName
  attr_reader :age, :year

  def initialize(name, surname, age)
    super(name, surname)
    @age = age
    @year = DateTime.now.year - @age
  end

  def age=(new_age)
    @year = DateTime.now.year - new_age
    @age = new_age
  end
  
#
  def year=(new_year)
    @age = DateTime.now.year - new_year
    @year = new_year
  end
  
end


