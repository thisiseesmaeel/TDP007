#!/bin/env ruby
# coding: utf-8
require "open-uri.rb"
require "set"

##Bra att ni markerat varje avsnitt. MEN VORE BRA OM NI MARKERAT VARJE UPPGIFT MED.

#------------------------------------ AVSNITT 1

## Det funkar också att skriva en egen implementation istallet för att använda en inbyggd funktion.(times)
def n_times(n, &block)
  n.times do 
    block.call()
  end
end

class Repeat
  def initialize(num)
    @num = num
  end

  def each(&block)
    @num.times do
      block.call()
    end
  end
end

n_times(3) { puts "Hello!" }

do_three = Repeat.new(3)
do_three.each { puts "Hooray!" }

def factorial(n)
  (1..n).inject { |memo, value| memo * value }
end

#------------------------------------ AVSNITT 2

class PersonName
  #Fint med att använda attr_accessor för att säga till Ruby att skapa de metoderna för mig
  attr_accessor :name, :surname 

  def initialize(name, surname)
    @name = name
    @surname = surname
  end
 # Tror att enligt uppgiften då skulle det vara "#{surname} #{name}"
  def fullname
    "#{name} #{surname}"
  end

  def fullname=(nameString)
    @name = nameString.split[0]
    @surname = nameString.split[1]
  end
end

myName = PersonName.new("Theodore", "Nilsson")

puts myName.fullname
puts myName.name

myName.fullname = "Tristan Baryonyx"

puts myName.name
puts myName.surname

class Person
  attr_accessor :age, :birthyear, :name
##Det funkar väl att inte definiera namn, efternamn och ålder i initialize funktionen. 
  def initialize(name = "first name", surname = "surname", age = 0)
    @age = age
    @birthyear = Time.new.year - age
    @name = PersonName.new(name, surname)
  end

  def birthyear=(year)
    @birthyear = year
    @age = Time.new.year - year
  end
end

me = Person.new("Theodore", "Nilsson", 30)

puts me.age
puts me.birthyear
puts me.name.fullname
puts me.name

me.birthyear = 1990
puts me.age

#------------------------------------ AVSNITT 3

class Integer
  def fib
    if self == 1
      1
    elsif self == 2
      1
    else (self - 1).fib + (self - 2).fib
    end
  end
end
##T.EX. HÄR BLEV VI LITE FÖRVIRRAD OM VILKA KOD HÖR TILL VILKEN UPPGIFT.
str = "lough out loud".split
puts str.inject("") { |acro, word| acro + word[0].upcase }

puts 16.fib

class String
  def acronym
##DET FUNKAR OCKSÅ ATT ANVÄNDA MAPS OCH JOIN FÖR ATT LÖSA DEN HÄR UPPGIFTEN.
    self.split.inject("") { |acro, word| acro += word[0].upcase }
  end
end

#------------------------------------ AVSNITT 4
# Här skulle det vara mindre Regex kod om du använder md.post_match vilket som returnerar det resten av strängen.
#Att ha en if sats som returnerar false om funktionen inte matchar någontig är ganska bra tror vi där kan man också skapa test för if sats med.
def find_user_name(string)
  md = /([a-zA-Z]*: )([a-zA-Z_[0-9]]+)/.match(string)
  md.captures[1]
end

def tag_names(string)
  md = string.scan(/(?<=<)([a-zA-Z]+)(?=>)/)
  ##SNYGGT MED ATT ANVÄNDA UNIQ HÄR
  md.uniq
end

# for testing
# Här går det också att använda "uri" modulen för att inte få warning. 
html = open("http://www.google.com/") { |f| f.read }
a = tag_names(html)
puts a.class

for i in (0..a.length - 1)
  puts a[i].class
end
