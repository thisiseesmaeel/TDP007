#!/bin/env ruby
# coding: utf-8

class Person
  attr_accessor :categories, :sum

  # Matches insurance category with user specified data in a hash.
  def initialize( car: "", zip: "0", d_license: "0", sex: "", age: "18", children: "0" )
    @categories = { "Bilmärke" => car , "Postnummer" => zip.to_s , "Körkort" => d_license , "Kön" => sex , "Ålder" => age, "Barn" => children }
    @sum = 0
  end

  # Modifies @sum depending on simple boolean comparison from policy file.
  def mod(*args)
    begin
      eval "if #{ @categories[ args[0] ] }#{args[1]} then @sum = @sum #{args[2]} end"
    rescue NoMethodError
      return "NoMethodError encountered"
    end
  end

  # Modifies @sum depending on function usage in policy file.
  def mod_if(*args)
    eval "if #{args[1]}(#{args[2]}, #{@categories[ args[0] ] }) then @sum = @sum #{args[3]} end"
  end
  
  # Helper function for comparing start values of zip codes.
  def starts_with(compare, value)
    value.to_s[0,compare.to_s.length] == compare.to_s
  end
  
  # Adds insurance points to @sum from file policy.rb 
  # Modifies @sum thereafter.
  def evaluate_policy( filename )
    instance_eval( File.read( filename ) )
    @sum
  end

  # Matches function name with corresponding value in @categories.
  # Increases @sum if value matches key in args[0].
  def method_missing(name, *args)
    if args[0]
      key = args[0].keys[0]
      if key.include?("-")
        first, last = key.split("-")
        range_array=*(first..last)
        if range_array.include?( @categories[ name.to_s ] )
          value = args[0][ "#{key}" ]
        end
      else
        value = args[0][ @categories[ name.to_s ] ]
      end
      if value
        @sum += value
      end
    end
  end

end

# # Main method with example of usage.
# def main
#   test_nil = Person.new
#   peter = Person.new(zip:"58647", d_license:"2", sex:"Man", age:"32")
#   kalle = Person.new(car:"Volvo", zip:"58647", d_license:"2", sex:"Man", age:"32")
#   puts test_nil.evaluate_policy("policy.rb")
# end


# main
