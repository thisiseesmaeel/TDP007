require './constraint-parser.rb'
require 'test/unit'

class Test_parser < Test::Unit::TestCase
  def test_Fahrenheit
    cp=ConstraintParser.new
    c,f=cp.parse "9*c=5*(f-32)"
    f.user_assign 100
    assert_equal(c.value, 37)
    f.forget_value "user"
    f.user_assign 0
    assert_equal(c.value, -18)
  end
  def test_math
    cp=ConstraintParser.new
    x,y=cp.parse "(x-8)*2=(y/2)+2"
    x.user_assign 8
    assert_equal(y.value, -4)
  end
  def test_same_side
    cp=ConstraintParser.new
    x,y=cp.parse "x+y=2"
    x.user_assign 3
    assert_equal(y.value, -1)
  end
end
