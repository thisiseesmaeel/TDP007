require "test/unit"
require "./uppg1.2.rb"

class TestTeam < Test::Unit::TestCase
    def test_weather
        day1 = Component.new("20", 10, 20)
        assert_equal("20", day1.name)
        assert_equal(10, day1.value_1)
        assert_equal(20, day1.value_2)
        assert_equal(10, day1.diff)
    end

    def test_create_weather
      test_string = ["<pre>", #bad
                     "MMU June 2002", #bad
                     "   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5", #good
                     "   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5", #good
                     "   30  90    45    68          63.6       0.00 H       240  6.0 220  17  4.8 200 41 1022.7", #good
                     "   mo  82.9  60.5  71.7    16  58.8       0.00              6.9          5.3", #bad doesn't start with number
                     "100. faslkdjfklsadfjlksdajf"]

      filtered = create_weather(test_string)

      assert_equal(3, filtered.length)
      assert_equal("1", filtered[0].name)
      assert_equal("30", filtered[-1].name)
    end

    def test_program
      array_of_days = []
      file_data = read_file("weather.txt")
      array_of_days = create_weather(file_data)

      array_of_days = sort_by_diff(array_of_days)
      assert_equal("14", array_of_days[0].name) # lowest diff (2)
      assert_equal("9", array_of_days[-1].name) # highest diff (54)
    end
end

