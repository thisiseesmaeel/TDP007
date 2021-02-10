require "./u1"
require "test/unit"

class Seminarium_3 < Test::Unit::TestCase
  def test_u1
    car1 = Person.new("Volvo", "58435", 2, "M", 32)
    assert_equal(15.66, car1.evaluate_policy("policy.rb"))

    car2 = Person.new("Fiat", "58647", 10, "W", 50)
    assert_equal(16.5, car2.evaluate_policy("policy.rb"))
  end
end
