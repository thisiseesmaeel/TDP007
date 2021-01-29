require './xml'
require 'test/unit'

class Test1 < Test::Unit::TestCase
  def setup
    url = "https://www.ida.liu.se/~TDP007/current/material/seminarie2/events.html"
    @calendar = Calendar.new(REXML::Document.new(open(url){|f| f.read}))
  end

  def test_summary
    assert_equal(@calendar[0].summary , "The Dark Carnival - 101.9FM" )
    assert_equal(@calendar[1].summary , "Sinister Sundays" )
  end

  def test_dtstart
    assert_equal(@calendar[0].dtstart, "2008-01-04 10:00pm EST" )
    assert_equal(@calendar[5].dtstart, "2008-01-20")
  end

  def test_location
    assert_equal(@calendar[0].location, "Kingston, Ontario" )
    assert_equal(@calendar[3].location, "The Bohemian, 248 Front Street, Belleville, Ontario")
  end

  def test_description
    assert_equal(@calendar[2].description, '"The Dark Carnival is two hours of spooky goodness. Every week, expect the best goth, industrial, and other dark music, as well as news and reviews from the wider world of goth culture. Embrace the darkness! Fridays, from 10 PM until the Witching Hour."')
    assert_equal(@calendar[7].description, "Gothic, Industrial, Dark Alternative w/ DJ LunaSlave" )
  end

  def test_to_s
    assert_equal(@calendar.to_s, File.open("output.txt").read)
  end

end
