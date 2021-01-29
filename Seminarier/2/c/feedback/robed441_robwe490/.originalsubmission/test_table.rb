require './table'
require 'test/unit'

class TestTable < Test::Unit::TestCase
  def test_football
    file = open("./football.txt") {|f| f.read}
    teams = Table.new(file, /([a-zA-Z_]+) .* (\d{1,2})\s*-\s*(\d{1,2})/, :to_i)

    assert_equal(teams.first.name, "Aston_Villa")
    assert_equal(teams.first.first_value, 46)
    assert_equal(teams.first.second_value, 47)

    assert_equal(teams[-1].name, "Arsenal")
    assert_equal(teams[-1].first_value, 79)
    assert_equal(teams[-1].second_value, 36)
    
    assert(teams.first.first_value.is_a?(Integer))
    assert(teams.first.second_value.is_a?(Integer))
    assert_equal(teams.first, teams[0])
  end

  def test_weather
    file = open("./weather.txt") {|f| f.read}
    weather = Table.new(file, /^\s+([^\s]{1,2})\s+([\d\.\*]+)\s+([^\s]+)\s+/, :to_f)

    assert_equal(weather.first.name, "14")
    assert_equal(weather.first.first_value, 61.0)
    assert_equal(weather.first.second_value, 59.0)

    assert_equal(weather[19].name, "mo")
    assert_equal(weather[19].first_value, 82.9)
    assert_equal(weather[19].second_value, 60.5)

    assert(weather.first.first_value.is_a?(Float))
    assert(weather.first.second_value.is_a?(Float))
    assert_equal(weather.first, weather[0])
  end
end
