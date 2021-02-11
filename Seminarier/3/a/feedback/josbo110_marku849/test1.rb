require "./s3"
require "./rdparse"
require "test/unit"

class Test_1 < Test::Unit::TestCase

    def test_person

    kalle = Person.new("Volvo", "58435", 2, "M", 32)
    kalle.evaluate_policy("policy.rb")
    
    assert_equal(15.66, kalle.calc(@score))

    
    sara = Person.new("BMW", "58726", 4, "F", 22)
    sara.evaluate_policy("policy.rb")

    assert_equal(63.5, sara.calc(@score))

    end

end

class Test_2 < Test::Unit::TestCase

    def test_lang
            
        temp = Lang.new
        
        assert_equal(false, temp.parse("false"))

        assert_equal(true, temp.parse("(not false)"))

        assert_equal(true, temp.parse("(set a true)"))

        assert_equal(false, temp.parse("(set b false)"))

        assert_equal(true, temp.parse("(or a b)"))

        assert_equal(false, temp.parse("(and a b)"))

    end
end