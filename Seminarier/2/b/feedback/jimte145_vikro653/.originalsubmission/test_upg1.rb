require './upg1.rb'
require 'test/unit'

class TestUppgift < Test::Unit::TestCase
  def test_simple

    file = "football.txt"
    @lst = MyListener.new
    src = File.new(file)
    REXML::Document.parse_stream(src,@lst)

    assert_equal(least_diff(6,8), "    8. Aston_Villa     38    12  14  12    46  -  47    50\n")
    assert_equal(table_sort(6,8).scan(/\n/).size, 20) #Skrivs alla 20 lagen ut?

    file = "weather.txt"
    @lst = MyListener.new
    src = File.new(file)
    REXML::Document.parse_stream(src,@lst)

    assert_equal(least_diff(1,2), "  14  61    59    60       5  55.9       0.00 RF      060  6.7 080   9 10.0  93 87 1008.6\n")
  end
end
