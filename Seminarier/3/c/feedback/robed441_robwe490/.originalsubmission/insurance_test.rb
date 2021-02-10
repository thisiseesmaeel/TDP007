require './insurance.rb'
require 'test/unit'

class Test1 < Test::Unit::TestCase
    def setup
        file = "policy.rb"
        @kalle = Person.new("Volvo", "58435", 2, "M", 32).evaluate_policy(file)
        @karin = Person.new("BMW",   "58726", 5, "F", 25).evaluate_policy(file)
        @berit = Person.new("Ford",  "38242", 1, "F", 72).evaluate_policy(file)
        @bosse = Person.new("Opel",  "58647", 9, "M", 40).evaluate_policy(file)
    end

    def test_evaluate_policy
        assert_equal 15.66, @kalle.score
        assert_equal 19.00, @karin.score
        assert_equal 11.00, @berit.score
        assert_equal 17.50, @bosse.score
    end
end
