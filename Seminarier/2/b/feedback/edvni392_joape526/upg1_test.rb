require "test/unit"
require_relative "upg1.rb"
class TestUpg1_Football < Test::Unit::TestCase
  def setup
    @data_array = data_fetcher(File.new("football.txt").read, /([a-zA-z]+).+\s(\d+)\s+-\s+(\d+).+/)
    @sorted_array = data_diff_sort(@data_array)
    @least_diff = least_diff(@data_array)
  end

  def test_data_fetcher()
    assert_equal(20, @data_array.size)

    assert_equal("Arsenal", @data_array[0][:identifier])
    assert_equal(79, @data_array[0][:data1])
    assert_equal(36, @data_array[0][:data2])

    assert_equal("Leicester", @data_array[19][:identifier])
    assert_equal(30, @data_array[19][:data1])
    assert_equal( 64, @data_array[19][:data2])
  end

  def test_data_diff_sort()
    assert_equal("Aston_Villa", @sorted_array[0][:identifier])
    assert_equal("Arsenal", @sorted_array[19][:identifier])
  end

  def test_least_diff()
    assert_equal("Aston_Villa", @least_diff[:identifier])
    assert_equal(46, @least_diff[:data1])
    assert_equal(47, @least_diff[:data2])

  end

end

class TestUpg1_Weather < Test::Unit::TestCase
  def setup
    @data_array = data_fetcher(File.new("weather.txt").read, /^\s+(\d{1,2})\s+(\d{1,2})\*?\s+(\d{1,2}).+\n/)
    @sorted_array = data_diff_sort(@data_array)
    @least_diff = least_diff(@data_array)
  end

  def test_data_fetcher()
    assert_equal(30, @data_array.size)

    assert_equal("1", @data_array[0][:identifier])
    assert_equal(88, @data_array[0][:data1])
    assert_equal(59, @data_array[0][:data2])

    assert_equal("30", @data_array[29][:identifier])
    assert_equal(90, @data_array[29][:data1])
    assert_equal( 45, @data_array[29][:data2])
  end

  def test_data_diff_sort()
    assert_equal("14", @sorted_array[0][:identifier])
    assert_equal("9", @sorted_array[29][:identifier])
  end

  def test_least_diff()
    assert_equal("14", @least_diff[:identifier])
    assert_equal(61, @least_diff[:data1])
    assert_equal(59, @least_diff[:data2])

  end

end
