require 'test/unit'
require './person'

class TestPerson < Test::Unit::TestCase
    def test_uppgift1
      two_rules_person = Person.new("Volvo","M", 2, 32, 58937)
      assert_equal(two_rules_person.evaluate_policy("policy.rb"), 25.38)
      postal_rule_person = Person.new("Volvo", "M", 5, 19, 58937)
      assert_equal(postal_rule_person.evaluate_policy("policy.rb"), 26.40)
      license_years_rule_person = Person.new("Fiat", "F", 1, 78, 58647)
      assert_equal(license_years_rule_person.evaluate_policy("policy.rb"), 11.70)
      no_rules_person = Person.new("Volvo", "F", 25, 50, 47357)
      assert_equal(no_rules_person.evaluate_policy("policy.rb"), 36.00)
    end
end