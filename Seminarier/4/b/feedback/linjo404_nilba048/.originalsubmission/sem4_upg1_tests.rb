require 'test/unit'
require './constraint_networks.rb'


class Tests_Upg1 < Test::Unit::TestCase

	def test_adder
  		a = Connector.new("a")
  		b = Connector.new("b")
  		c = Connector.new("c")
 		Adder.new(a, b, c)	

 		# 10 + 5 = ?
 		a.user_assign(10)
  		b.user_assign(5)
  		assert_equal(c.value, 15)

  		# ? + 5 = 25
  		a.forget_value "user"
  		c.user_assign(25)
  		assert_equal(a.value, 20)

  		# 3 + ? = 25
  		b.forget_value "user"
  		a.user_assign(3)
  		assert_equal(b.value, 22)

  		# 3 + (-8) = ?
  		c.forget_value "user"
  		b.user_assign(-8)
  		assert_equal(c.value, -5)
	end

	def test_multiplier
		a = Connector.new("a")
  		b = Connector.new("b")
  		c = Connector.new("c")
 		Multiplier.new(a, b, c)

 		# 2 * 5 = ?
 		a.user_assign(2)
  		b.user_assign(5)
  		assert_equal(c.value, 10)

  		# ? * 5 = 40
  		a.forget_value "user"
  		c.user_assign(40)
  		assert_equal(a.value, 8)

  		# 10 * ? = 40
  		b.forget_value "user"
  		a.user_assign(10)
  		assert_equal(b.value, 4)

  		# 10 * (-8) = ?
  		c.forget_value "user"
  		b.user_assign(-8)
  		assert_equal(c.value, -80)
	end

	def test_celsius2fahrenheit
		c,f = celsius2fahrenheit

		c.user_assign 100
		assert_equal(f.value, 212)

		c.user_assign 0
		assert_equal(f.value, 32)

		c.forget_value "user"
		assert_equal(f.value, false)

		f.user_assign 100
		assert_equal(c.value, 37)
	end
end

