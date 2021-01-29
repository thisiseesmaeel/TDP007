require "test/unit"
require "./uppg2.rb"

class TestTeam < Test::Unit::TestCase
    def test_find_events
      doc = read_xml("calender.txt")
      doc = find_event(doc)
      assert_equal(8, doc.length) # by using ctr + f we can only find 8 matches for "vevent"
    end

    def test_create_events
      doc = read_xml("calender.txt")
      doc = find_event(doc)
      doc = create_event(doc)
      
      first = doc[0]
      last = doc[-1]
      assert_equal(Event, first.class)
      assert_equal(8, doc.length) # there should be only 8 event objects

      # check https://www.ida.liu.se/~TDP007/current/material/seminarie2/events.html
      # friday the 4th should be first according to the calender
      # in Ontario
      assert_equal("2008-01-04 10:00pm EST", first.date)
      assert_equal("Ontario", first.region)


      # sunday 27th should be the last entry
      assert_equal("2008-01-27", last.date)
      assert_equal("Sinister Sundays", last.event)
      assert_equal("The Bohemian", last.org_fn)
      assert_equal("248 Front Street", last.adress)
      assert_equal("Belleville", last.location)
      # desciprtion as taken from the website
      description = "Gothic, Industrial, Dark Alternative w/ DJ LunaSlave"
      assert_equal(description, last.description)
      assert_equal("Ontario", last.region)
    end

    def test_TBD
      doc = read_xml("calender.txt")
      doc = find_event(doc)
      doc = create_event(doc)

      third_event = doc[2]

      assert_equal("The Dark Carnival - 101.9FM", third_event.event)
      assert_equal("TBD", third_event.adress)
    end
end

