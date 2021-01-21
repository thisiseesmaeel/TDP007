#!/bin/env ruby
# coding: iso-8859-1
require 'open-uri.rb'
require 'set'
#------------------------------------ AVSNITT 1
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

def factorial n
  (1..n).inject { |memo, value| memo * value}
end

#------------------------------------ AVSNITT 2

class PersonName
  attr_accessor :name, :surname
  
  def initialize(name, surname)
    @name = name
    @surname = surname
  end

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
  def initialize(name = "first name", surname = "surname", age = 0)
    @age = age
    @birthyear = Time.new.year-age
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
    if self ==1
      1
    elsif self == 2
      1
    else (self-1).fib + (self-2).fib
    end
  end
end

str = "lough out loud".split
puts str.inject("") { |acro, word| acro + word[0].upcase }


puts 16.fib

class String
  def acronym
    self.split.inject("") { |acro, word| acro += word[0].upcase }
  end
end


#------------------------------------ AVSNITT 4

def find_user_name(string)
  md = /([a-zA-Z]*: )([a-zA-Z_[0-9]]+)/.match(string)
  md.captures[1]
end


def tag_names(string)
  md = string.scan( /(?<=<)([a-zA-Z]+)(?=>)/ )
  md.uniq
end

# for testing
html = open("http://www.google.com/") { |f| f.read }
a = tag_names(html)
puts a.class

for i in (0..a.length-1) do
  puts a[i].class
end
