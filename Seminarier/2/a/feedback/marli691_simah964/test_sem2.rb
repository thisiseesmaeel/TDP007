require './football'
require './weather'
require './xmlhantering'
require 'test/unit'

class UnitTest < Test::Unit::TestCase

  def test_football
    teams = read_file("footballfile.txt")
    team_names = teams.map {|name| name.name}
    assert_equal("Arsenal", team_names[0])
    assert_equal("Leicester", team_names[-1])
    least_difference = teams.min {|a,b| a.absdiff <=> b.absdiff}
    assert_equal("Aston_Villa", least_difference.name)
  end

  def test_weather
    weather = read_file_w("weatherfile.txt")
    days = weather.map {|day| day.day}
    assert_equal("14", days[0])
    assert_equal("9", days[-1])
    least_diff = weather.min {|a,b| a.diff <=> b.diff}
    assert_equal("14", least_diff.day)
  end

  def test_xml
    events = parsing("events.html")
    dates = events.map {|dates| dates.dtstart}
    summary = events.map {|sum| sum.summary}
    assert_equal("2008-01-04 10:00pm EST", dates[0])
    assert_equal("2008-01-27", dates[-1])
    assert_equal("The Dark Carnival - 101.9FM", summary[0&&2&&4&&6])
    assert_equal("Sinister Sundays", summary[1&&3&&5&&7]
  end
end


