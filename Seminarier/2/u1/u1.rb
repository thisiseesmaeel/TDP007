#! user/bin/env ruby


## FUNCTION FOR GETTING THE WANTED MATCHES
def football_file(file)
  team_list = Array.new
  re = /(\w+)(?:\s+)(?:\d+\s+\d+\s+\d+\s+\d+\s+)(\d+)\s+(?:-)\s+(\d+)(?:\s+)\d+/
  team_list = File.readlines(file).to_s.scan(re)
end

team_list = football_file("football.txt")

## FUNCTION FOR CALCULATING THE DIFFERENCE BETWEEN TEAMS AND SORTING THEM
def goal_diff(team_list)
  team_list.each do |team|
    only_goal_diff = team[1].to_i - team[2].to_i
    team.append(only_goal_diff.abs)
  end
  team_list.sort_by! { |index| index[3] }
  return team_list.each { |team| p team }
end

sorted_list_teams = goal_diff(team_list)
puts

## FUNCTION FOR PRINTING THE TEAM WHICH HAS THE LEAST GOAL DIFFERENCE.
def least_goal_diff(sorted_list_teams)
  least_goal_team = puts "The least goal difference is: " + sorted_list_teams[0][0].to_s + " with difference of " + sorted_list_teams[0][3].to_s + " point/s."
  return least_goal_team
end

least_goal_diff(sorted_list_teams)
puts

## FUNCTION FOR GETTING THE WANTED MATCHES
def weather_file(file)
  weather_list = Array.new
  re = /(\d+)(?:\s+)(\d+\D+)(?:\s+)(\d+\D+)(?:\S*)(?:\s+\d+\s+\d+\D+\d+\D+\d+\D+\d+\D+\d+\S+\D+\d+\D+\d+\D+\d+\s+\d+\D+\d+\D+\d+\D+\d+\s+\d+\s+\d+\D+\d+)/
  weather_list = File.readlines(file).to_s.scan(re)
end

weather_list = weather_file("weather.txt")

## FUNCTION FOR CALCULATING THE DIFFERENCE BETWEEN TEMPERATURES IN THE DAYS IN LIST.
def weather_diff(weather_list)
  weather_list.each do |weather|
    only_weather_diff = weather[1].to_i - weather[2].to_i
    weather.append(only_weather_diff.abs)
  end
  weather_list.sort_by! { |index| index[3] }
  weather_list.each { |day| p day }
end

sorted_weather_day = weather_diff(weather_list)
puts

## FUNCTION FOR PRINTING THE DAY WHICH HAS THE LEAST TEMPERATURE DIFFERENCE.
def least_temp_diff(sorted_weather_day)
  sorted_weather_day.sort_by! { |index| index[3] }
  least_weather_day = puts "The least weather temperature difference is day: " + sorted_weather_day[0][0].to_s + " with difference of " + sorted_weather_day[0][3].to_s + " grade."
  return least_weather_day
end

least_temp_diff(sorted_weather_day)
puts
