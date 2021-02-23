#!/usr/bin ruby
# coding: iso-8859-1
#TODO: Negative value tests
#TODO: Divide by zero

require 'test/unit'
require './constraint_networks'

class Test_CE < Test::Unit::TestCase

  def test_adder 
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")
    Adder.new(a, b, c)
    
    a.user_assign(10)
    b.user_assign(5)
    a.forget_value "user"    
    c.user_assign(20)
    assert_equal(a.value, 15, "20 - 5 = 15 testing addition of a positive num and a negative num")
  end

  def test_sum_negative
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")
    Adder.new(a, b, c)
  
    a.user_assign(-5)
    b.user_assign(-5)
    assert_equal(c.value, -10, "-5 + (-5) = -10 testing addition of negative nums")
  end 

  def test_adder_backwards
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")
    Adder.new(a, b, c)
    
    c.user_assign(-5)
    b.user_assign(10)
    assert_equal(a.value, -15, "10 - 15 = -5 testing backwards propagation of Adder")
  end

  def test_multiplier
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")  
    Multiplier.new(a, b, c)
    
    
    a.user_assign(3)
    c.user_assign(6)
    assert_equal(b.value, 2, "b should be 2")
  end

  def test_false_value
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")  
    Adder.new(a, b, c)

    b.user_assign(1)
    a.user_assign(2)
    c.user_assign(3)
    b.forget_value "user"
    puts b.value
    assert_equal(b.value.to_s, "false", "b should be false")
  end

  def test_mutiply_by_zero
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")  
    Multiplier.new(a, b, c)

    a.user_assign(0)
    b.user_assign(100)
    assert_equal(c.value, 0, "0 * 100 = 0 testing multiplication with 0")
  end

    # Test ConstantConnectors by raising ContradictionExceptions

  def test_divider

    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")  
    Divider.new(a, b, c)

    a.user_assign(8)
    b.user_assign(4)
    assert_equal(c.value, 2, "8 / 2 = 4 testing common division")
  end

  def test_variabel_0
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")  
    Divider.new(a, b, c)

    b.user_assign(1)
    c.user_assign(0)
    assert_equal(a.value, 0, "a / 1 = 0  variable a should be 0")
  end

  def test_divide_by_zero
    a = Connector.new("a")
    b = Connector.new("b")
    c = Connector.new("c")  
    Divider.new(a, b, c)
    
    a.user_assign(1)
    begin
      b.user_assign(0)
    rescue ZeroDivisionError => zero
    end
    assert_equal(zero.class.to_s, "ZeroDivisionError", "1 / 0 = c  Dividing by zero should raise ZeroDivisionError")
  end


  def test_celsius2fahrenheit
    c,f = celsius2fahrenheit
    c.user_assign 20
    assert_equal(f.value, 68, "testing c to f conversion")

    c.forget_value "user"
    f.user_assign 212
    assert_equal(c.value, 100, "testing f to c conversion")
    
    f.forget_value "user"
    c.user_assign(-40)
    assert_equal(f.value, -40, "testing negative values")
  end

end


