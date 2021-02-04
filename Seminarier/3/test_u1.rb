require "./u1"
require "test/unit"

class Seminarium_3 < Test::Unit::TestCase
  def test_u1
    car = Person.new("Volvo", "58435", 2, "M", 32)
    assert_equal(15.66, car.evaluate_policy("policy.rb"))
  end
end
