require "test/unit"
require "./uppgift1.rb"

class TestFaculty < Test::Unit::TestCase
    def test_array_simple
      arr = []
      n_times(6) { arr << "hello world" }
      assert_equal(6, arr.length)
    end

    def test_calculation
      num = 0
      n_times(100) { num += 1}
      assert_equal(100, num)
    end


    def test_class_repeat
      arr = [1, 2, 3, 4, 5, 6]
      rep = Repeat.new(3)
      rep.each { arr.pop }
      assert_equal(3, arr.length)
    end
end
