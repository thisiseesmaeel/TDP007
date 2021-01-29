#!/bin/env ruby
# coding: utf-8

def small_sort(src, reg)
  results = src.scan(reg)
  i = 0
  small = Array.new
  
  results.each do
    |e|
    small[i] = {e[0] => (e[1].to_i - e[2].to_i)}
    i += 1
  end

  return small.sort_by{|hash| (hash[hash.keys.first]).abs}
end

def main_u1
  result = ""
  src = File.read("football.txt")
  fotball_res = small_sort(src, /\d+\.\s(\w+).+?(\d+)\s+-\s+(\d+)/) #Football regex
  fkeys = fotball_res[0].keys
  result += fkeys.first + " har haft minst skillad mellan gjorda och insläppta mål. Skillanden är #{fotball_res[0][fkeys.join]}.\n\n"

  fotball_res.each{ |team| result += team.keys.join + "\n"}

  result += "\n\n"

  src = File.read("weather.txt")
  weather_res = small_sort(src, /^\s+(\d+)\s+(\d+)\s+(\d+)/) #Weather regex
  wkeys = weather_res[0].keys
  
  result += "Dag " + wkeys.first + " hade den minsta tempraturskillnaden mellan varmast och kallast dag. Skillnaden är #{weather_res[0][wkeys.join]} grader.\n\n"

  weather_res.each{ |day| result += "Dag " + day.keys.join + "\n"}
  puts result
  return result
end

if __FILE__ == $0 #Checks if file is the main-source (if the file is loaded as a program or module (remember python?)) 
  main_u1()
end
