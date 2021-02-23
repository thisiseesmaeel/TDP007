require 'test/unit'
require './constraint_networks.rb'
require './constraint-parser.rb'

class Test1 < Test::Unit::TestCase
    def test_adder
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
end

class Test2 < Test::Unit::TestCase
    def test_adder
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Adder.new(a, b, c)
        a.user_assign(15)
        c.user_assign(20)
        b.forget_value "user"
        assert_equal(b.value, 5)
      end
end

class Test3 < Test::Unit::TestCase
    def test_multiplier
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Multiplier.new(a, b, c)
        a.user_assign(10)
        b.user_assign(5)
        assert_equal(c.value, 50)
        a.forget_value "user"
        c.user_assign(20)
        assert_equal(a.value, 4)
      end
end

class Test4 < Test::Unit::TestCase
    def test_celsius2fahrenheit
        fahrenheit, celsius = celsius2fahrenheit
        celsius.user_assign(0)
        assert_equal(fahrenheit.value, 32)
        celsius.user_assign(5)
        assert_equal(fahrenheit.value, 41)
    end
end

class Test5 < Test::Unit::TestCase
    def test_fahrenheit2celsius
        fahrenheit, celsius = celsius2fahrenheit
        fahrenheit.user_assign(50)
        assert_equal(celsius.value, 10)
        fahrenheit.user_assign(140)
        assert_equal(celsius.value, 60)
    end
end

class Test6 < Test::Unit::TestCase
    def test_parser
        new_parser=ConstraintParser.new
        c,f=new_parser.parse("9*c=5*(f-32)")

        f.user_assign(41)
        assert_equal(5, c.value)

        f.user_assign(100)
        assert_equal(37, c.value)

        a,b=new_parser.parse("a=(b-100)")
        b.user_assign(100)
        assert_equal(0, a.value)
    end
end