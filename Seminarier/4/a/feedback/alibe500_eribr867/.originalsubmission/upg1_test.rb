require_relative 'constraint_networks'
require 'test/unit'

class Testupg < Test::Unit::TestCase

  def test_adder
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")
    Adder.new(a, b, c)
    a.user_assign(10)
    assert_equal( a.value, 10, "wrong a ")

    b.user_assign(5)
    assert_equal( b.value, 5, "wrong b")

    assert_equal( c.value, 15, "wrong output ")

    a.forget_value "user"
    c.user_assign(20)
    assert_equal( a.value, 15, "wrong a ")

    c.forget_value "user"
    a.user_assign(-15)
    assert_equal( c.value, -10, "wrong c")
  end

  def test_multi
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")
    Multiplier.new(a, b, c)
    a.user_assign(10)
    assert_equal( a.value, 10, "wrong a")

    b.user_assign(5)
    assert_equal( b.value, 5, "wrong b")

    assert_equal( c.value, 50, "wrong output ")

    a.forget_value "user"
    c.user_assign(20)
    assert_equal( a.value, 4, "wrong a")

    c.forget_value "user"
    a.user_assign(0)
    assert_equal( c.value, 0, "wrong c 0")
  end

  def test_celsius2fahrenheit
    c,f=celsius2fahrenheit
    c.user_assign 0
    assert_equal(f.value, 32)
    c.forget_value "user"

    f.user_assign(95)
    assert_equal(c.value, 35)
    f.forget_value "user"
  end
end
