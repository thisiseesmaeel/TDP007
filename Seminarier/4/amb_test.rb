#!/usr/bin/env ruby
# coding: utf-8

# N.B. Due to a bug in Ruby 1.9.1 the use of callcc will sometimes crash.
# Use either a lower version of Ruby (e.g. 1.8.5) or 1.9.2 or later version.

require 'continuation'

class Amb

  def initialize
    @calls_to_choose = 0
    @ctb = 1
    @backtrack_points = []
  end

  def ctb
    @ctb
  end
  
  def backtrack
    @ctb += 1
    if @backtrack_points.empty?
      fail ExhaustedError, "Can't backtrack"
    else
      @backtrack_points.pop.call
    end
  end

  def choose(choices)
    @calls_to_choose += 1
    #puts "call to choose #{@calls_to_choose}"
    choices_array = choices.to_a
    backtrack if choices_array.empty?
    callcc do |cc|
      @backtrack_points.push cc
      return choices_array[0]
    end
    choose(choices_array[1..choices_array.length])
  end
  
  def require(condition)
    backtrack unless condition
  end

  def next
    # Här saknas en funktionskropp
  end
end

class ExhaustedError < RuntimeError
  
end


def my_problem
  a = Amb.new
  begin
    gum = a.choose 1..10
    apple = a.choose 1..10
    coke = a.choose 1..10
    #puts "tried: #{gum}, #{apple}, #{coke}"
    a.require gum*1+apple*7+coke*12 == 100
    
    puts "#{gum} tuggummi, #{apple} äpplen och #{coke} burkar cola"
    
    a.next
  rescue ExhaustedError
    puts "Det var alla möjligheter."
    puts a.ctb
  end
end

my_problem
