require './constraint_networks'
require 'test/unit'

class TestConstraints < Test::Unit::TestCase
	def test_adder
		puts "Adder test"
		a = Connector.new("a")
		b = Connector.new("b")
		c = Connector.new("c")
		Adder.new(a, b, c)

		a.user_assign(10)
		b.user_assign(5)
		assert_equal(15, c.value.to_i)

		a.forget_value "user"
		c.user_assign(20)
		assert_equal(15, a.value.to_i)

		# Both inputs are forgotten
		b.forget_value "user"
		assert_false(b.value)
		assert_false(a.value)

		a.user_assign(7)
		b.user_assign(10)
		assert_equal(20, c.value.to_i)
	end

	def test_multiplier
		puts "Multiplier test"
		a = Connector.new("a")
		b = Connector.new("b")
		c = Connector.new("c")
		Multiplier.new(a, b, c)

		a.user_assign(3)
		b.user_assign(0)
		assert_equal(0, c.value.to_i)

		b.forget_value "user"
		b.user_assign(5)
		assert_equal(15, c.value.to_i)

		a.forget_value "user"
		c.user_assign(5)
		assert_equal(1, a.value.to_i)
	end

	def test_celsius2fahrenheit
		puts "C2F test"
		c,f = celsius2fahrenheit
		c.user_assign(0)
		assert_equal(32, f.value.to_i)
		
		c.forget_value "user"
		f.user_assign(0)
		assert_equal(-18, c.value.to_i)
		
		f.forget_value "user"
		c.user_assign(100)
		assert_equal(212, f.value.to_i)
	end
end
