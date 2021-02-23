require './constraint_networks.rb'
require 'test/unit'
class Test_celsius2fahrenheit < Test::Unit::TestCase
  def test_temp
    c, f = celsius2fahrenheit()
    c.user_assign 100
    assert_equal(212, f.value)
    c.user_assign 0
    assert_equal(32, f.value)
    c.forget_value "user"
    f.user_assign 100
    assert_equal(37, c.value.to_i)
  end
end
