require './constraint_networks'
require './constraint-parser'
require 'test/unit'
class TestUpg1 < Test::Unit::TestCase
    def test_upg1_adder1
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Adder.new(a, b, c) # Skapar en Adder som sparar värdet för 
                           # a, b, c samt kallar på add_constraint på alla
        a.user_assign(2) # propagerar värdet
        b.user_assign(4)
        assert_equal(6, c.value)

        a.forget_value "user"
        b.forget_value "user"

        a.user_assign(2)
        c.user_assign(4)
        assert_equal(2, b.value)

        a.forget_value "user"
        c.forget_value "user"

        b.user_assign(2)
        c.user_assign(4)
        assert_equal(2, a.value)
    end

    def test_upg1_c2f
        c, f = celsius2fahrenheit
        c.user_assign(10) # propagerar värdet
        assert_equal(50, f.value)
    
        c.forget_value "user"
        c.user_assign(-10)
        assert_equal(14, f.value)
    
        c.forget_value "user"
        f.user_assign(95)
        assert_equal(35, c.value)
    
        f.forget_value "user"
        f.user_assign(-22)
        assert_equal(-30, c.value)
    end
end

class TestUpg2 < Test::Unit::TestCase
    def test_upg2
        cp=ConstraintParser.new
        c,f=cp.parse "9*c=5*(f-32)"
        c.user_assign(10) # propagerar värdet
        assert_equal(50, f.value)
    
        c.forget_value "user"
        c.user_assign(-10)
        assert_equal(14, f.value)
    
        c.forget_value "user"
        f.user_assign(95)
        assert_equal(35, c.value)
    
        f.forget_value "user"
        f.user_assign(-22)
        assert_equal(-30, c.value)
    end

end
