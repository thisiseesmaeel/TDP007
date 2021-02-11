require './seminarie3'
require 'test/unit'
class TestUpg1 < Test::Unit::TestCase
    def test_upg1_no_modifier
        testperson = Person.new("Volvo", 59435, 5, "M", 32)
        testperson.evaluate_policy("policy.rb")
        assert_equal(5+9+4.5+1+4.5,testperson.sum)
    end

    def test_upg1_modifier1
        testperson = Person.new("Volvo", 59435, 2, "M", 32)
        testperson.evaluate_policy("policy.rb")
        assert_equal((5+9+4+1+4.5)*0.9,testperson.sum)
    end

    def test_upg1_modifier2
        testperson = Person.new("Volvo", 58985, 5, "M", 32)
        testperson.evaluate_policy("policy.rb")
        assert_equal((5+9+4.5+1+4.5)*1.2,testperson.sum)
    end

    def test_upg1_both_modifier
        testperson = Person.new("Volvo", 58435, 2, "M", 32)
        testperson.evaluate_policy("policy.rb")
        assert_equal((5+0+4+1+4.5)*0.9*1.2, testperson.sum)
    end

    def test_upg1_lower_values
        testperson = Person.new("Volvo", 49435, 0, "M", 10)
        testperson.evaluate_policy("policy.rb")
        assert_equal((5+0+3+1+0)*0.9,testperson.sum)
    end

    def test_upg1_higher_values
        testperson = Person.new("Volvo", 89435, 89, "M", 150)
        testperson.evaluate_policy("policy.rb")
        assert_equal((5+9+5+1+3),testperson.sum)
    end
end

class TestUpg2 < Test::Unit::TestCase
    def test_upg2_set
        test = Dsl.new
        test.eval_test("(set banan 5)")
        test.eval_test("(set test svar)")
        test.eval_test("(set korv (or true false))")

        assert_equal(test.eval_test("banan"), 5)
        assert_equal(test.eval_test("test"), "svar")
        assert_equal(test.eval_test("korv"), true)
    end

    def test_upg2_or
        test = Dsl.new
        assert_equal(test.eval_test("(or true true)"), true)
        assert_equal(test.eval_test("(or true false)"), true)
        assert_equal(test.eval_test("(or false true)"), true)
        assert_equal(test.eval_test("(or false false)"), false)
    end

    def test_upg2_and
        test = Dsl.new
        assert_equal(test.eval_test("(and true true)"), true)
        assert_equal(test.eval_test("(and true false)"), false)
        assert_equal(test.eval_test("(and false true)"), false)
        assert_equal(test.eval_test("(and false false)"), false)
    end

    def test_upg2_not
        test = Dsl.new
        test.eval_test("(set korv (or true false))")
        assert_equal(test.eval_test("(not true)"), false)
        assert_equal(test.eval_test("(not false)"), true)
        assert_equal(test.eval_test("(not korv)"), false)
    end

    def test_upg2_var
        test = Dsl.new
        assert_equal(test.eval_test("5"), 5)
        assert_equal(test.eval_test("(565465456)"), 565465456)
        assert_equal(test.eval_test("string"), "string")
        assert_equal(test.eval_test("(string)"), "string")
    end
end
