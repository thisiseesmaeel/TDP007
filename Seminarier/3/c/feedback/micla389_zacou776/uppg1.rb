#!/usr/bin/env ruby
# coding: utf-8
require 'date'

class Person
  attr_accessor :car_brand, :zip_address, :gender, :license_year, :birth_year

  def initialize(car_brand="", zip_address="", driving_years=0, gender="", age=0)
    @points        = 0
    @car_brand     = car_brand
    @zip_address   = "Z" + zip_address
    @gender        = gender
    @license_year  = Date.today.year - driving_years
    @birth_year    = Date.today.year - age
  end

  def extra_rules()
    if((Date.today.year - @license_year) < 3 && @gender == "M")
      @points *= 0.9
    end

    if(@car_brand == "Volvo" && @zip_address.start_with?("Z58"))
      @points *= 1.2
    end
  end

  def update_points(name, args)
    if(name.to_s == "years" && args[0].include?(Date.today.year - @license_year))
      @points += args[1]
      
    elsif(name.to_s == "age" && args[0].include?(Date.today.year - @birth_year))
      @points += args[1]
      
    elsif(name.to_s == @car_brand || name.to_s == @zip_address || name.to_s == @gender)
      @points += args[0]
    end
  end
  
  def evaluate_policy(file)
    @points = 0
    instance_eval(File.read(file))
    extra_rules()
    return @points.round(2)
  end

  def method_missing(name, *args)
    update_points(name, args)
  end
end

if __FILE__ == $0 # <--- samma som i python: 'modul eller körning?'

  kalle = Person.new("Volvo", "58435", 2, "M", 32)
  printf("%s \n", kalle)
  puts(kalle.evaluate_policy("policy.rb"))

end
