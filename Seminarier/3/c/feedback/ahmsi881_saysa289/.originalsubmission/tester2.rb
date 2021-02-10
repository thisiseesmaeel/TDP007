require 'test/unit'
require './uppgift2.rb'

class TestParse < Test::Unit::TestCase

    def test_uppgift2
        tester = Logic.new()

        #True test, Use "true" with random variable
        assert_equal(tester.roll_test("(set 100 true)"), true) 
        assert_equal(tester.roll_test("(set a true)"), true)

        #False test, Use "or" with two false statements
        assert_equal(tester.roll_test("(or false false)"), false) 

        #Integer variable test, Set random variable (string or integer) to 50
        assert_equal(tester.roll_test("(set b 100)"), true) 

        #Letter variable test, Set random variable (string or integer) to "c"
        assert_equal(tester.roll_test("(set 101 b)"), true) 

        #Expression test, test expression within expression
        assert_equal(tester.roll_test("(and (or a false) (not true))"), false)

        #Not test, test not within expression 
        assert_equal(tester.roll_test("(not true)"), false)

        #And test, test and within expression 
        assert_equal(tester.roll_test("(and false true)"), false)

        #And test, test and within expression 
        assert_equal(tester.roll_test("(and true true)"), true)

        #Variable-assignment test
        assert_equal(tester.roll_test("(set f false)"), false)
        assert_equal(tester.roll_test("(not f)"), true)
    end

end
