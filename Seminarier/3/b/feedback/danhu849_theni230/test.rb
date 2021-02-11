require './person'
require 'test/unit'

class TestFaculty < Test::Unit::TestCase			
	def test_policy
		#postnummer 58435 existerar ej i policy.rb; tillägger inge poäng
		kalle = Person.new("Volvo", "58435", 2, "M", 32)
		assert_equal(kalle.length, 5)
		assert_equal(kalle.evaluate_policy("policy.rb"), 15.66)
		
		#5 + 5 + 4.5 + 1 + 3.5 = 19.0
		kajsa = Person.new("Mercedes", "58726", 5, "F", 26)
		assert_equal(kajsa.evaluate_policy("policy.rb"), 19.0)
		
		#(4 + 3 + 3 + 1 + 2.5) * 0.9 = 12.15
		joakim = Person.new("Opel", "58647", 1, "M", 20)
		assert_equal(joakim.evaluate_policy("policy.rb"), 12.15)
	end
	
	def test_policy_trash
		kalle = Person.new("Volvo", "58435", 2, "M", 32)
		assert_equal(kalle.length, 5)
		assert_equal(kalle.evaluate_policy("policy2.rb"), 15.66)
		
		kajsa = Person.new("Mercedes", "58726", 5, "F", 26)
		assert_equal(kajsa.evaluate_policy("policy.rb"), 19.0)
		
		joakim = Person.new("Opel", "58647", 1, "M", 20)
		assert_equal(joakim.evaluate_policy("policy.rb"), 12.15)
	end
end

