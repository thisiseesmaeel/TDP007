require './constraint_networks.rb'
require 'test/unit'

class TestConstraints < Test::Unit::TestCase
    def test_adder
        p "ADDER TESTS"
        puts
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Adder.new(a, b, c)
        
        a.user_assign(10)
        b.user_assign(5)
        assert_equal(15, c.value)

        a.forget_value("user") 
        c.user_assign(20) 
        assert_equal(15, a.value) #a + 5 = 20

        b.forget_value("user")
        a.user_assign(15) 
        assert_equal(5, b.value) #15 + b = 20
        
        c.forget_value("user")
        b.user_assign(20) 
        assert_equal(35, c.value) # 15 + 20 = c
    end
    
    def test_multiplier
        p "MULTIPLIER TESTS"
        puts
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Multiplier.new(a, b, c)
        
        a.user_assign(10)
        b.user_assign(5)
        assert_equal(50, c.value) # 10 * 5 = 50

        a.forget_value("user")
        c.user_assign(25)
        assert_equal(5, a.value) # a * 5 = 25

        b.forget_value("user")
        a.user_assign(5)
        c.user_assign(500)
        assert_equal(100, b.value) # 5 * b = 500

        c.forget_value("user")
        b.user_assign(20) 
        assert_equal(100, c.value) # 5 * 20 = c
    end

    def test_fah_and_cel
        p "FAHRENHEIT TO CELSIUS TESTS" 
        puts
        celsius, fahrenheit = celsius2fahrenheit
        celsius.user_assign(100)
        assert_equal(212, fahrenheit.value)

        celsius.forget_value("user")
        fahrenheit.user_assign(32)
        assert_equal(0, celsius.value)

        celsius.forget_value("user")
        fahrenheit.forget_value("user")
        celsius.user_assign(0)
        assert_equal(32, fahrenheit.value)

        celsius.forget_value("user")
        fahrenheit.forget_value("user")
        fahrenheit.user_assign(32)
        assert_equal(0, celsius.value)
    end
end 

