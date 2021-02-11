#!/bin/env ruby
require 'test/unit'
require './weather'

class TestWeather < Test::Unit::TestCase  

  def test_make_weather_array()
    w_arr = make_weather_array("weather.txt")  
    assert_equal(w_arr[0].day, "1")
    assert_equal(w_arr[17].day, "18")
    assert_equal(w_arr[19].day, "20")    
    assert_equal(w_arr[-1].day, "30")    
  end

  def test_sort_by_temp_diff
    w_arr = make_weather_array("weather.txt")  
    w_arr.sort_by_temp_diff
    assert_equal(w_arr[0].day, "14")
    assert_equal(w_arr[17].day, "23")
    assert_equal(w_arr[-1].day, "9")
  end


end
