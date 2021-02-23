require 'test/unit'
require './constraint-parser.rb'

class TestConstraint < Test::Unit::TestCase
  
  def test_celsius_fahrenheit
    
    cp = ConstraintParser.new
    c, f = cp.parse("9 * c = 5 * (f - 32)")

    f.user_assign(0)
    assert_equal(-18, c.value)

    f.user_assign(0.0)
    assert_equal(-17.77777777777778, c.value)

    f.user_assign(100)
    assert_equal(37, c.value)

    f.user_assign(212)
    assert_equal(100, c.value)

    f.user_assign(466)
    assert_equal(241, c.value)

    f.user_assign(-2)
    assert_equal(-19, c.value)

    f.forget_value "user"

    c.user_assign(50)
    assert_equal(122, f.value)

    c.user_assign(-50)
    assert_equal(-58, f.value)

    c.user_assign 15.2
    assert_equal(59.36, f.value)
  end

  def test_celsius_fahrenheit2
    
    cp = ConstraintParser.new
    f, c = cp.parse("5*(f-32)=9*c")

    f.user_assign(0)
    assert_equal(-18, c.value)

    f.user_assign(0.0)
    assert_equal(-17.77777777777778, c.value)

    f.user_assign(100)
    assert_equal(37, c.value)

    f.user_assign(212)
    assert_equal(100, c.value)

    f.user_assign(466)
    assert_equal(241, c.value)

    f.user_assign(-2)
    assert_equal(-19, c.value)

    f.forget_value("user")

    c.user_assign(50)
    assert_equal(122, f.value)

    c.user_assign(-50)
    assert_equal(-58, f.value)

    c.user_assign 15.2
    assert_equal(59.36, f.value)
  end

  def test_celsius_kelvin
    cp = ConstraintParser.new
    # cant parse floats 273.15
    # doesn't work without ()
    c,k = cp.parse("(c + 273) = k")

    c.user_assign(0)
    assert_equal(273, k.value)

    c.user_assign(-10)
    assert_equal(263, k.value)

    c.forget_value("user")
    
    k.user_assign(0)
    assert_equal(-273, c.value)

    k.user_assign(-101)
    assert_equal(-374, c.value)
  end

  def test_simple
    cp = ConstraintParser.new
    x,y = cp.parse("x = y")

    x.user_assign(10)
    assert_equal(10, y.value)

    x.user_assign(-10)
    assert_equal(-10, y.value)

  end
end


