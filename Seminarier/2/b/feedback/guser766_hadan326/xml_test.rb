#!/bin/env ruby
require 'test/unit'
require './xml_contact'

class TestVevent < Test::Unit::TestCase  

  def test_make_vevent_array
    vevent_arr = make_vevent_array
    for vevent in vevent_arr do
      assert_equal(vevent.class, Vevent)
    end
  end


  def test_main()
    vevent_arr = make_vevent_array
    assert_equal(vevent_arr[0].name, "The Dark Carnival - 101.9FM")
    assert_equal(vevent_arr[0].locality, "Kingston")
    assert_equal(vevent_arr[0].region, "Ontario")
    assert_equal(vevent_arr[0].when, "2008-01-04 10:00pm EST")
    assert_equal(vevent_arr[-2].when, "2008-01-25 10:00pm EST")
  end

  def test_make_description
    vevent_arr = make_vevent_array
    assert_equal(vevent_arr[0].make_description, "\"The Dark Carnival is two hours of spooky goodness. Every week, expect the best goth, industrial, and other dark music, as well as news and reviews from the wider world of goth culture. Embrace the darkness! Fridays, from 10 PM until the Witching Hour.\"\n")
    assert_equal(vevent_arr[-1].make_description, "Gothic, Industrial, Dark Alternative w/ DJ LunaSlave\n")
  end

end
