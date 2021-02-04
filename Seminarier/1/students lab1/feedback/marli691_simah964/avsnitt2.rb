# coding: utf-8
require 'date'

#Uppgift 5
class PersonName
  def initialize(name, surname)
    @name = name
    @surname = surname
  end

  def get_fullname
    return "#{@name} #{@surname}"
  end

  def set_fullname(fullname)
    fullname_array = fullname.split
    @name = fullname_array[0]
    @surname = fullname_array[1]
  end
end

=begin
nils = PersonName.new("Nils", "Bark")
puts "Namn: " + nils.get_fullname
nils.set_fullname("Nisse Burk")
puts "Namn bytt till: " + nils.get_fullname
=end

#Uppgift 6
class Person
  def initialize(name = "", surname = "", age = 0)
    @name = PersonName.new(name, surname)
    @age = age
    @birthyear = Date.today.year - age
  end

  def name
    @name.get_fullname
  end

  def name=(new_name)
    @name.set_fullname(new_name)
  end
  
  def birthyear
    @birthyear
  end

  def birthyear=(new_year)
    @birthyear = new_year
    @age = Date.today.year - birthyear
  end

  def age
    @age
  end

  def age=(new_age)
    @age = new_age
    @birthyear = Date.today.year - age
  end
end

=begin
kalle = Person.new("Kalle", "Karlsson", 20)
puts "Denna personen heter #{kalle.name}. Deras ålder är #{kalle.age} och de föddes år #{kalle.birthyear}"

kalle.name = "Kalle Danielsson"
kalle.age = 50
puts "Denna personen heter #{kalle.name}. Deras ålder är #{kalle.age} och de föddes år #{kalle.birthyear}"
=end
