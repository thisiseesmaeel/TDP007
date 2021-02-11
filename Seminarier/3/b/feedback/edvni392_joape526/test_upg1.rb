require './upg1'
require 'test/unit'

class TestUpg1 < Test::Unit::TestCase
  def test_persons
    #both
    kalle =  Person.new("Volvo", "58726", 2, "M", 32)
    assert_equal(21.06, kalle.evaluate_policy("policy.rb"))
    #0 rule
    p = Person.new("BMW", "58937", 50, "F", 20)
    assert_equal(22.5, p.evaluate_policy("policy.rb"))

    #1 rule
    p = Person.new("BMW", "58937", 2, "M", 20)
    assert_equal(19.35, p.evaluate_policy("policy.rb"))

    # Shorter policy (policy1.rb)
    p = Person.new("BMW", "58937", 2, "M", 20)
    assert_equal(19.35, p.evaluate_policy("policy1.rb"))

    #Added car brand Ferrari (policy3.rb)
    p = Person.new("Ferrari", "58937", 2, "M", 20)
    assert_equal(104.85, p.evaluate_policy("policy3.rb"))
  end
end
