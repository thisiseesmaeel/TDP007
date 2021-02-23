require './constraint_networks'
require './constraint-parser'
require 'test/unit'

 

class TestFaculty < Test::Unit::TestCase            
    #uppgift 1
    def test_adder
		a = Connector.new("a")
		b = Connector.new("b")
		c = Connector.new("c")
		Adder.new(a, b, c)
		
		#räknar ut c
		a.user_assign(10)
		assert_equal(a.value, 10)
		b.user_assign(5)
		assert_equal(b.value, 5)
		assert_equal(c.value, 10+5)
		puts
		
		#glömmer a, c glöms bort också
		a.forget_value "user"
		c.user_assign(20)
		assert_equal(b.value, 5)
		assert_equal(c.value, 20)
		assert_equal(a.value, 20-5)
		puts
		
		#glömmer b, a glöms bort också
		b.forget_value "user"
		a.user_assign(25)
		assert_equal(c.value, 20)
		assert_equal(a.value, 25)
		assert_equal(b.value, 20-25)
		puts
		
		#glömmer c, b glöms bort också
		c.forget_value "user"
		b.user_assign(5)
		assert_equal(b.value, 5)
		assert_equal(a.value, 25)
		assert_equal(c.value, 25+5)
		puts
		#puts"a = "+a.value.to_s
		#puts"b = "+b.value.to_s
		#puts"c = "+c.value.to_s
		
		a2 = Connector.new("a2")
		b2 = Connector.new("b2")
		c2 = Connector.new("c2")
		Adder.new(a2, b2, c2)
		
		#räknar ut a = c - b
		b2.user_assign(5)
		assert_equal(b2.value, 5)
		c2.user_assign(10)
		assert_equal(c2.value, 10)
		assert_equal(a2.value, 10-5)
		puts
    end
    
    def test_multiplier
		a = Connector.new("a")
		b = Connector.new("b")
		c = Connector.new("c")
		Multiplier.new(a, b, c)
		
		#räknar ut c
		a.user_assign(2)
		assert_equal(a.value, 2)
		b.user_assign(5)
		assert_equal(b.value, 5)
		assert_equal(c.value, 5*2)
		puts
		
		#glömmer a, c glöms bort också
		a.forget_value "user"
		c.user_assign(20)
		assert_equal(b.value, 5)
		assert_equal(c.value, 20)
		assert_equal(a.value, 20/5)
		puts
		
		#glömmer b, a glöms bort också
		b.forget_value "user"
		a.user_assign(2)
		assert_equal(c.value, 20)
		assert_equal(a.value, 2)
		assert_equal(b.value, 20/2)
		puts
		
		#glömmer c, b glöms bort också
		c.forget_value "user"
		b.user_assign(5)
		assert_equal(b.value, 5)
		assert_equal(a.value, 2)
		assert_equal(c.value, 5*2)
		#puts
		#puts"a = "+a.value.to_s
		#puts"b = "+b.value.to_s
		#puts"c = "+c.value.to_s
		
		a2 = Connector.new("a2")
		b2 = Connector.new("b2")
		c2 = Connector.new("c2")
		Multiplier.new(a2, b2, c2)
		
		#räknar ut a = c / b
		b2.user_assign(5)
		assert_equal(b2.value, 5)
		c2.user_assign(10)
		assert_equal(c2.value, 10)
		assert_equal(a2.value, 10/5)
		puts
	end

    def test_celsius2fahrenheit_celsius
        celsius, fahrenheit = celsius2fahrenheit()

        celsius.user_assign(10)
        assert_equal(celsius.value, 10)
        assert_equal(fahrenheit.value, 50)

        celsius.user_assign(-20)
        assert_equal(celsius.value, -20)
        assert_equal(fahrenheit.value, -4)

        #extremfall
        celsius.user_assign(1000000)
        assert_equal(celsius.value, 1000000)
        assert_equal(fahrenheit.value, 1800032)

        celsius.user_assign(1.0812)
        assert_equal(celsius.value, 1.0812)
        assert_equal(fahrenheit.value, 33.94616)
    end

    def test_celsius2fahrenheit_fahrenheit
        celsius, fahrenheit = celsius2fahrenheit()

        fahrenheit.user_assign(68)
        assert_equal(celsius.value, 20)
        assert_equal(fahrenheit.value, 68)

        fahrenheit.user_assign(-22)
        assert_equal(celsius.value, -30)
        assert_equal(fahrenheit.value, -22)

        #extremfall
        fahrenheit.user_assign(5225)
        assert_equal(celsius.value, 2885)
        assert_equal(fahrenheit.value, 5225)

        fahrenheit.user_assign(1.4)
        assert_equal(celsius.value, -17.00000)
        assert_equal(fahrenheit.value, 1.4)
	end

	#Uppgift 2
	def test_parser_fahrenheit
        cp=ConstraintParser.new
		c,f=cp.parse "9*c=5*(f-32)"

		f.user_assign 68
        assert_equal(c.value, 20)
        assert_equal(f.value, 68)

        f.user_assign(-22)
        assert_equal(c.value, -30)
        assert_equal(f.value, -22)

        #extremfall
        f.user_assign(5225)
        assert_equal(c.value, 2885)
        assert_equal(f.value, 5225)

        f.user_assign(1.4)
        assert_equal(c.value, -17.00000)
        assert_equal(f.value, 1.4)
	end
	
	def test_parser_celsius
        cp=ConstraintParser.new
		c,f=cp.parse "9*c=5*(f-32)"
		
        c.user_assign(10)
        assert_equal(c.value, 10)
        assert_equal(f.value, 50)

        c.user_assign(-20)
        assert_equal(c.value, -20)
        assert_equal(f.value, -4)

        #extremfall
        c.user_assign(1000000)
        assert_equal(c.value, 1000000)
        assert_equal(f.value, 1800032)

        c.user_assign(1.0812)
        assert_equal(c.value, 1.0812)
        assert_equal(f.value, 33.94616)
    end
end

