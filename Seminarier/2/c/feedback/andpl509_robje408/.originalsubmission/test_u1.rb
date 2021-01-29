require './u1'
require 'test/unit'

class Seminarium_2 < Test::Unit::TestCase
  def test_goal_diff
    team_list = football_file("football.txt")
    sorted_list_teams = goal_diff(team_list)
    ##SORTED TEAMS LIST TEST
    assert_equal(["Tottenham", "49", "53", 4], sorted_list_teams[1])
    assert_not_equal(["Aston_Villa", "46", "47", 1], sorted_list_teams[3])

    ##LEAST GOAL DIFFERENCE TEST
    assert_equal("Aston_Villa", sorted_list_teams[0][0].to_s)
    assert_equal("Arsenal", sorted_list_teams[-1][0].to_s)

    ##WEATHER TEST
    weather_list = weather_file("weather.txt")
    sorted_weather_days = weather_diff(weather_list)
    ##SORTED WEATHER LIST
    assert_equal(["14", "61   ", "59    ", 2], sorted_weather_days[0])
    assert_not_equal(["9", "86   ", "32*   ", 54], sorted_weather_days[2])

    ##LEAST TEMPERATURE DIFFERENCE TEST
    assert_equal("14", sorted_weather_days[0][0].to_s)
    assert_equal("30", sorted_weather_days[-2][0].to_s)

  end
end
