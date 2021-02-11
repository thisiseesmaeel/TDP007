# coding: utf-8
require './upg2.rb'
require 'test/unit'

class TestUppgift < Test::Unit::TestCase
  def test_simple

    file = "events.html"
    src = File.new(file)
    doc = REXML::Document.new src
    lst = Calandar.new(doc)
    REXML::Document.parse_stream(src,lst)
    
    assert_equal(lst.get_calandar.count, 31) #Har programmet läst in alla 31 dagar?
    assert_equal(lst.get_all_events.count, 8) #Har programmet läst in alla 8 evenemang?

    #Kontrollerar den rätt datum?
    assert_equal(lst.get_event_on_day(25), "25 : The Dark Carnival - 101.9FM")
    assert_equal(lst.get_event_on_day(24), "no events on day 24")

    #Felkontroll
    assert_equal(lst.get_event_on_day(32), "Invalid date")
    assert_equal(lst.get_event_on_day(999999), "Invalid date")


  end
end
