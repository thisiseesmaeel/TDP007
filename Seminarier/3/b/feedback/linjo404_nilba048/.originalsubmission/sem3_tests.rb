require 'stringio'
require 'test/unit'
require './sem3_upg1.rb'
require './sem3_upg2.rb'




class Tests_Upg1 < Test::Unit::TestCase
	def test_person
		# test rule 1
		kalle = Person.new("Volvo", "58435", 2, "M", 32)
		assert_equal(kalle.evaluate_policy("policy.rb"), 15.66)

		jim = Person.new("Ford", "58435", 19, "M", 21)
		assert_equal(jim.evaluate_policy("policy.rb"), 13)

		# test rule 2
		viktor = Person.new("Volvo", "58435", 0, "M", 31)
		assert_equal(viktor.evaluate_policy("policy.rb"), 14.58)

		bengt = Person.new("Subaru", "29194", -1, "T", 17)
		assert_equal(bengt.evaluate_policy("policy.rb"), 0)

		daniella = Person.new("Fiat", "58647", 1, "K", 24)
		assert_equal(daniella.evaluate_policy("policy.rb"), 13.5)	
	end

end


class Tests_Upg2 < Test::Unit::TestCase
	def test_logic
		$stdin = StringIO.new("true\nexit")
		assert_equal(Logic.new.eval, true)

		$stdin = StringIO.new("(and true true)\nexit")
		assert_equal(Logic.new.eval, true)

		$stdin = StringIO.new("(or false (and false false))\nexit")
		assert_equal(Logic.new.eval, false)

		$stdin = StringIO.new("(or false (and (not true) (and true (or (and (not false) (or (not true) true)) true))))\nexit")
		assert_equal(Logic.new.eval, false)

		# test :var
		$stdin = StringIO.new("var\nexit")
		assert_equal(Logic.new.eval, "var")

		$stdin = StringIO.new("(set var false)\nexit")
		assert_equal(Logic.new.eval, false)

		$stdin = StringIO.new("(set var false)\n(set var true)\nexit")
		assert_equal(Logic.new.eval, true)

		$stdin = StringIO.new("(set a false)\n(set b a)\nb\nexit")
		assert_equal(Logic.new.eval, false)

		$stdin = StringIO.new("(set var false)\n(or var (and (not var) (or true var)))\nexit")
		assert_equal(Logic.new.eval, true)


	end
end