#!/bin/env ruby
# coding: iso-8859-1

def make_weather_array(file)
  src = File.new(file)
  data = src.read
  table = /(?<=<pre>)([\s\D\d]*)(?=<\/pre>)/.match(data)
  rows = table.captures[0].split("\n")
  weather_array = Array.new
  wanted_data = rows[5..-2]
  wanted_data.each do |row|
    weather_array.push( Day_Temp.new( row.scan(/([0-9]+)/)[0..2].join(" ").split ) )
  end
  weather_array
  
end


class Day_Temp
  attr_accessor :day, :max_temp, :min_temp
  
  # Väldigt skönt med garbage collection!
  def initialize(scanned_array)
    @day, @max_temp, @min_temp = scanned_array
  end

end


class Array

  # Använder precis samma funktion från fotbollslagen.
  def p_weather
    self.each { |weather| puts("Day #{weather.day}:  #{weather.max_temp}  #{weather.min_temp}") }
  end
  
  def sort_by_temp_diff
    self.sort_by! do |day|
                     (day.max_temp.to_i - day.min_temp.to_i)**2
    end
  end

end



def main
  weather_arr = make_weather_array("weather.txt")
  weather_arr.sort_by_temp_diff
  puts "Day with smallest temp difference: #{weather_arr[0].day}"
  puts "Days with smallest temp difference in order:"
  puts "----------------------------------------"
  weather_arr.p_weather
end


main


