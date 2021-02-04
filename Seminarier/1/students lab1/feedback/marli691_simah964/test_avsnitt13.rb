require './avsnitt1&3'
require 'test/unit'

class TestFaculty < Test::Unit::TestCase
  def test_simple
    assert_equal((1..20).inject { |multi, n| multi * n },2432902008176640000)
    assert_equal(factorial(20),2432902008176640000)

    assert_equal(longest_string(["apelsin", "banan", "citron"]),"apelsin")
    assert_equal(longest_string(["hej", "kanske", "flera"]),"kanske")
    assert_equal(longest_string(["hejdå", "kan", "i"]),"hejdå")

    assert_equal(1.fib,1)
    assert_equal(2.fib,1)
    assert_equal(3.fib,2)
    assert_equal(4.fib,3)
    assert_equal(5.fib,5)

    temp = [1,2,3]
    temp.rotate_left
    assert_equal(temp, [2,3,1])
    temp.rotate_left(3)
    assert_equal(temp, [2,3,1])
  end
end
