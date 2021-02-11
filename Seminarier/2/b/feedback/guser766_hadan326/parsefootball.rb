#!/bin/env ruby
# coding: iso-8859-1
#vilket lag som haft mist skillnad i antal gjorda (F) och insläppta mål(A)

# Pushes teams from file into array.
def make_team_array(file)
  src = File.new(file)
  data = src.read
  table = /(?<=<pre>)([\s\w.-]*)(?=<\/pre>)/.match(data)
  rows = table.captures[0].split("\n")
  team_array = Array.new
  rows.each { |row| if row[5] == '.' then team_array.push( Team.new( row.gsub(/-/, "") ) ) end }
  team_array
end



class Team
  attr_accessor :row_nr, :name, :p, :w, :l, :d, :f, :a, :pts
  
  def initialize(row)
    @row_nr, @name , @p, @w, @l, @d, @f, @a, @pts = row.split
  end
 
end


class Array

  def p_teams
    self.each { |team| puts(team.name) }
  end

  def sort_by_goal_diff
    self.sort_by! do |team| -
    (team.f.to_i - team.a.to_i)**2 
    end
  end

end


# Står inte explicit att fotbollslagen ska skrivas ut med rangordningssiffror.
def main
  team_arr = make_team_array("football.txt")
  team_arr.sort_by_goal_diff
  puts "Team with smallest goal difference: #{team_arr[0].name}"
  puts "Teams with smallest goal difference in order:"
  puts "----------------------------------------"
  team_arr.p_teams
end


main


