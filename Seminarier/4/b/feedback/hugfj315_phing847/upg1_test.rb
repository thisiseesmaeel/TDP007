require './constraint_networks.rb'
require 'test/unit'

class TestUppgift < Test::Unit::TestCase
    def test_simple
   
        # Tester för addition
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Adder.new(a, b, c)

        # c okänd
        a.user_assign(10)
        b.user_assign(20)
        assert_equal(c.value, 30)

        # a okänd
        a.forget_value("user")
        c.user_assign(10)
        assert_equal(a.value, -10)

        # b okänd
        b.forget_value("user")
        a.user_assign(10)
        assert_equal(b.value, 0)

        # Tester för multiplikation 
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Multiplier.new(a, b, c)

        # c okänd
        a.user_assign(10)
        b.user_assign(20)
        assert_equal(c.value, 200)

        # a okänd
        a.forget_value("user")
        c.user_assign(40)
        assert_equal(a.value, 2)

        # b okänd
        b.forget_value("user")
        a.user_assign(2)
        assert_equal(b.value, 20) 

        ############################################################

        # Tester för celsius2fahrenheit

        c,f=celsius2fahrenheit

        c.user_assign 100
        assert_equal(f.value, 212.0) 

        c.user_assign 0
        assert_equal(f.value, 32.0) 

        c.forget_value "user"
        f.user_assign 100
        assert_equal(c.value, 37.77777777777778) 

    end
  end
  