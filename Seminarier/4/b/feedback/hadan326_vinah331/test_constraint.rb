require 'test/unit'
require './constraint_networks.rb'
require './constraint-parser.rb'


class TestNetworks < Test::Unit::TestCase
    def test1
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Adder.new(a, b, c)
        a.user_assign(10)
        b.user_assign(5)
        assert_equal(c.value, 15)
        a.forget_value "user"
        c.user_assign(20)
        assert_equal(a.value, 15)  
    end

    def test2
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Adder.new(a, b, c)
        a.user_assign(10)
        b.user_assign(5)
        assert_equal(c.value, 15)
        b.forget_value "user"
        c.user_assign(20)
        assert_equal(b.value, 10)
    end
    
    def test3
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Multiplier.new(a, b, c)
        a.user_assign(2)
        b.user_assign(3)
        assert_equal(c.value, 6)
        a.forget_value "user"
        c.user_assign(12)
        assert_equal(a.value, 4)  
    end

    def test4
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Multiplier.new(a, b, c)
        a.user_assign(2)
        b.user_assign(5)
        assert_equal(c.value, 10)
        b.forget_value "user"
        c.user_assign(12)
        assert_equal(b.value, 6)  
    end
    
    def test5
        c, f = celsius2fahrenheit
        c.user_assign 100
        assert_equal(f.value, 212)
        c.forget_value "user"
        f.user_assign -41
        puts c.value
        assert_equal(c.value.round(), -41)
    end

 
    def test_parse1
        cp=ConstraintParser.new
        c,f=cp.parse "9*c=5*(f-32)"
        f.user_assign 0
        assert_equal(c.value, -18)
        f.user_assign 100
        assert_equal(c.value, 37)
    end

    def test_parse2
        cp=ConstraintParser.new
        c,f=cp.parse "c/10=2+f"
        c.user_assign 100
        assert_equal(f.value, 8)
        c.user_assign -100
        assert_equal(-12, f.value)
    end

    def test_parse3
        cp=ConstraintParser.new
        c,f=cp.parse "c=9*f"
        f.user_assign 2
        assert_equal(c.value, 18)
    end

    def test_parse4
        cp=ConstraintParser.new
        c,f = cp.parse "c-10= 2/f"
        f.user_assign 1
        assert_equal(c.value, 12)
    end

    def test_parse5
        cp=ConstraintParser.new
        c,f = cp.parse "c+10= f/3"
        f.user_assign 9
        assert_equal(c.value, -7)
    end





end