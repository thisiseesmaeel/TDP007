require './constraint_networks'
require './constraint-parser'
require 'test/unit'

class UnitTest < Test::Unit::TestCase

  def test_adder
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")
    Adder.new(a,b,c)
    a.user_assign(20)
    b.user_assign(15)
    assert_equal(35, c.value)
    a.forget_value "user"
    c.user_assign(5)
    assert_equal(-10 ,a.value)
    b.forget_value "user"
    a.user_assign(3)
    assert_equal(2, b.value)
    e = ConstantConnector.new("e", 10)
    d = Connector.new("d")
    f = Connector.new("f")
    assert_equal(10, e.value)
    Adder.new(e,d,f)
    d.user_assign(10)
    assert_equal(20, f.value)
  end

  def test_multiplier
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")
    Multiplier.new(a,b,c)
    a.user_assign(5)
    b.user_assign(10)
    assert_equal(50, c.value)
    a.forget_value "user"
    c.user_assign(30)
    assert_equal(3, a.value)
    b.forget_value "user"
    a.user_assign(15)
    assert_equal(2, b.value)
  end


  def test_parser
    cp = ConstraintParser.new
    c,f = cp.parse "9*c=5*(f-32)"
    f.user_assign 0
    assert_equal(-18, c.value)
    f.user_assign 100
    assert_equal(37, c.value)
    f.forget_value "user"
    c.user_assign 0
    assert_equal(32, f.value)
    f.forget_value "user"
    c.user_assign 15
    assert_equal(59, f.value)
  end

end


