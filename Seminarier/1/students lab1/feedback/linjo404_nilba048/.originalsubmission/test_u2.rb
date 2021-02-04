require './u2'
require 'test/unit'

class TestFaculty < Test::Unit::TestCase
  def test_u2
    assert_equal(1, factorial(1))
    assert_equal(1, factorial(0))
    assert_equal(120, factorial(5))
    assert_equal(2432902008176640000, factorial(20))
  end
end

