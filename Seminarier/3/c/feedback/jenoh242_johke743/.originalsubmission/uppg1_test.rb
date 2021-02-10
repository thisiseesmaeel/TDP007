#!/bin/env ruby
# encoding: utf-8

require 'test/unit'
require './uppg1.rb'

class TestPolicy < Test::Unit::TestCase

  def test_policy
    kalle = Person.new("Volvo", 58435, 2, "M", 32)
    assert_equal(kalle.evaluate_policy("policy.rb"), 15.66)

    #No extra points(*1.2) from postal code starting with 57
    kalle = Person.new("Volvo", 57435, 2, "M", 32)
    assert_equal(kalle.evaluate_policy("policy.rb"), 13.05)

    #No extra points(*1.2) from speical car "Volvo"
    kalle = Person.new("BMW", 58435, 2, "M", 32)
    assert_equal(kalle.evaluate_policy("policy.rb"), 13.05)

    #(4 + 9 + 4 + 1 + 4,5) * 0.3 = 20.25
    kalle = Person.new("Citroen", 58937, 2, "M", 32)
    assert_equal(kalle.evaluate_policy("policy.rb"), 20.25)

    # (3 + 5 + 3 + 1 + 2,5) = 14.5
    kalle = Person.new("Fiat", 58726, 1, "K", 18)
    assert_equal(kalle.evaluate_policy("policy.rb"), 14.5)

    #(4 + 3 + 4.5 + 1 + 3) = 15.5
    kalle = Person.new("Ford", 58647, 4, "F", 21)
    assert_equal(kalle.evaluate_policy("policy.rb"), 14.5)

    #(5 + 3 + 4.5 + 1 + 3.5) = 16
    kalle = Person.new("Mercedes", 58647, 4.1, "F", 24.5) #works with floats, bad? good?
    assert_equal(kalle.evaluate_policy("policy.rb"), 16)

    #(4 + 0 + 5 + 1 + 4) = 14
    kalle = Person.new("Nissan", -1000, 99, "K", 28)
    assert_equal(kalle.evaluate_policy("policy.rb"), 14)

    #(4 + 0 + 5 + 1 + 3) = 13
    kalle = Person.new("Opel", 11111, 45, "K", 72)
    assert_equal(kalle.evaluate_policy("policy.rb"), 13)

  end

end
