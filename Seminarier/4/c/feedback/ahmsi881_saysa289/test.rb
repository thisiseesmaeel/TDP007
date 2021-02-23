#!/usr/bin/env ruby
# coding: utf-8
require 'test/unit'
require './uppg1'
require './uppg2'
class TestOne < Test::Unit::TestCase

  def setup()
    @kalle = Person.new("Volvo", "58435", 2, "M", 32)
    @bengt = Person.new("Volvo", "56234", 4, "M", 28)
    @steve = Person.new("Volvo", "58647", 7, "M", 45)
    @cissi = Person.new("Volvo", "57432", 1, "W", 19)
    @berit = Person.new("Volvo", "58726", 29, "W", 78)
    @sture = Person.new("Volvo", "58937", 19, "M", 65)
  end
  
  def test_a()

    assert_equal(15.66, @kalle.evaluate_policy("policy.rb"))
    assert_equal(14.5, @bengt.evaluate_policy("policy.rb"))
    assert_equal(22.2, @steve.evaluate_policy("policy.rb"))
    assert_equal(11.5, @cissi.evaluate_policy("policy.rb"))
    assert_equal(22.8, @berit.evaluate_policy("policy.rb"))
    assert_equal(28.8, @sture.evaluate_policy("policy.rb"))
    
    @kalle.car_brand = "Fiat"
    @bengt.car_brand = "BMW"
    @steve.car_brand = "Ford"
    @cissi.car_brand = "Nissan"
    @berit.car_brand = "Opel"
    @sture.car_brand = "Mercedes"

    assert_equal(11.25, @kalle.evaluate_policy("policy.rb"))
    assert_equal(14.5, @bengt.evaluate_policy("policy.rb"))
    assert_equal(17.5, @steve.evaluate_policy("policy.rb"))
    assert_equal(10.5, @cissi.evaluate_policy("policy.rb"))
    assert_equal(18, @berit.evaluate_policy("policy.rb"))
    assert_equal(24, @sture.evaluate_policy("policy.rb"))
  end

  def test_b()
    assert_equal(15.66, @kalle.evaluate_policy("policy.rb"))
    assert_equal(14.5, @bengt.evaluate_policy("policy.rb"))
    assert_equal(22.2, @steve.evaluate_policy("policy.rb"))
    assert_equal(11.5, @cissi.evaluate_policy("policy.rb"))
    assert_equal(22.8, @berit.evaluate_policy("policy.rb"))
    assert_equal(28.8, @sture.evaluate_policy("policy.rb"))
    
    @kalle.zip_address = "Z57453"
    @bengt.zip_address = "Z58937"
    @steve.zip_address = "Z58726"
    @cissi.zip_address = "Z58647"
    @berit.zip_address = "Z56893"
    @sture.zip_address = "Z54976"

    assert_equal(13.05, @kalle.evaluate_policy("policy.rb"))
    assert_equal(28.2, @bengt.evaluate_policy("policy.rb"))
    assert_equal(24.6, @steve.evaluate_policy("policy.rb"))
    assert_equal(17.4, @cissi.evaluate_policy("policy.rb"))
    assert_equal(14, @berit.evaluate_policy("policy.rb"))
    assert_equal(15, @sture.evaluate_policy("policy.rb"))
  end

  def test_c()
    assert_equal(15.66, @kalle.evaluate_policy("policy.rb"))
    assert_equal(14.5, @bengt.evaluate_policy("policy.rb"))
    assert_equal(22.2, @steve.evaluate_policy("policy.rb"))
    assert_equal(11.5, @cissi.evaluate_policy("policy.rb"))
    assert_equal(22.8, @berit.evaluate_policy("policy.rb"))
    assert_equal(28.8, @sture.evaluate_policy("policy.rb"))
    
    @kalle.zip_address = "Z57453"
    @bengt.zip_address = "Z58937"
    @steve.zip_address = "Z58726"
    @cissi.zip_address = "Z58647"
    @berit.zip_address = "Z56893"
    @sture.zip_address = "Z54976"

    assert_equal(13.05, @kalle.evaluate_policy("policy.rb"))
    assert_equal(28.2, @bengt.evaluate_policy("policy.rb"))
    assert_equal(24.6, @steve.evaluate_policy("policy.rb"))
    assert_equal(17.4, @cissi.evaluate_policy("policy.rb"))
    assert_equal(14, @berit.evaluate_policy("policy.rb"))
    assert_equal(15, @sture.evaluate_policy("policy.rb"))
  end
end

class TestTwo < Test::Unit::TestCase
  def test_vars
    assert_equal("true", Compiler.new.code(["(set a true)", "(set b false)", "(and a b)", "exit"]))
    assert_equal("false", Compiler.new.code(["(set a false)", "(or a false)", "exit"]))
    assert_equal("true", Compiler.new.code(["(set b true)", "(and true b)","exit"]))
    assert_equal("true", Compiler.new.code(["(set a true)", "(not a)","exit"]))
    
  end
  
  def test_vals
    assert_equal("true", Compiler.new.code(["(or true false)","exit"]))
    assert_equal("false", Compiler.new.code(["(and true false)","exit"]))
    assert_equal("false", Compiler.new.code(["(and false false)","exit"]))
    assert_equal("false", Compiler.new.code(["(and false false)","exit"]))
    assert_equal("false", Compiler.new.code(["(not false)","exit"]))
  end
end


