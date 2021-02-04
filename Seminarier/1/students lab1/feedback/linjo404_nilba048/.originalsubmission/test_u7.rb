require './u7'
require 'test/unit'

class TestInteger < Test::Unit::TestCase
  def test_fibonacci
    assert_equal(0, 0.fib)
    assert_equal(1, 1.fib)
    assert_equal(1, 2.fib)
    assert_equal(2, 3.fib)
    assert_equal(3, 4.fib)
    assert_equal(34, 9.fib)
    assert_equal(89, 11.fib)
  end
end

