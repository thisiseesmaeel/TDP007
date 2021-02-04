require_relative "./upg5"
require "date"

class Person
  def initialize(name = "", surname = "", age = 0)
    @age = age
    @birthyear = Date.today.year - age
    @name = PersonName.new
    @name.fullname = "#{name} #{surname}"
  end

  attr_reader :age
  attr_reader :birthyear
  attr_reader :name

  def birthyear=(by)
    @birthyear = by
    @age = Date.today.year - by
  end

  def age=(age)
    @age = age
    @birthyear = Date.today.year - age
  end
end
