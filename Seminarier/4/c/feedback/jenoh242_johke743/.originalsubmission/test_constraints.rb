
require 'test/unit'
require './constraint_networks.rb'

class TestConstraint < Test::Unit::TestCase

  #include PrettyPrint
  
  def test_adder

    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")
    Adder.new(a, b, c)

    # c = 10 + 5
    a.user_assign(10)
    b.user_assign(5)
    assert_equal(15, c.value)

    # 20 = a + 5
    a.forget_value("user")
    c.user_assign(20)
    assert_equal(15, a.value)

    # 20 = 21 + b
    b.forget_value("user")
    a.user_assign(21)
    assert_equal(-1, b.value)

    # c = 21 + (-50)
    c.forget_value("user")
    b.user_assign(-50)
    assert_equal(-29, c.value)

  end


  def test_multiplier
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")
    Multiplier.new(a, b, c)

    # c = 5 * 5
    a.user_assign(5)
    b.user_assign(5)
    assert_equal(25, c.value)

    # 50 = a * 5
    a.forget_value("user")
    c.user_assign(50)
    assert_equal(10, a.value)

    # 50 = 2 * b
    b.forget_value("user")
    a.user_assign(2)
    assert_equal(25, b.value)

    # c = (-2) * (-2)
    a.forget_value("user")
    b.forget_value("user")
    c.forget_value("user")
    a.user_assign(-2)
    b.user_assign(-2)
    assert_equal(4, c.value)
    
    # -5 = a * (-2.5)
    a.forget_value("user")
    b.forget_value("user")
    c.forget_value("user")
    c.user_assign(-5)
    b.user_assign(-2.5)
    assert_equal(2, a.value)

    # c = 1.002 * 3.44
    a.forget_value("user")
    b.forget_value("user")
    c.forget_value("user")
    a.user_assign(1.002)
    b.user_assign(3.44)
    assert_equal(3.44688, c.value)
  end


def test_celsius2farenheit

  c, f = celsius2fahrenheit

  c.user_assign 100
  assert_equal(212, f.value)

  c.user_assign 0
  assert_equal(32, f.value)

  c.forget_value "user"
  f.user_assign 100
  assert_equal(37, c.value)

end

end


