#!/bin/env ruby
require 'test/unit'
require './parsefootball'

class TestFootball < Test::Unit::TestCase  

  def test_make_team_array()
    fb_arr = make_team_array("football.txt")  
    assert_equal(fb_arr[0].name, "Arsenal")
    assert_equal(fb_arr[17].name, "Ipswich")
    assert_equal(fb_arr[19].name, "Leicester")    
  end

  def test_sort_by_goal_diff
    fb_arr = make_team_array("football.txt")  
    fb_arr.sort_by_goal_diff
    assert_equal(fb_arr[0].name, "Arsenal")
    assert_equal(fb_arr[17].name, "Tottenham")
    assert_equal(fb_arr[19].name, "Aston_Villa")
  end


end
