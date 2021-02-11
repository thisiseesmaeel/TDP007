require './dsl'
require './bnf'
require 'test/unit'

class UnitTest < Test::Unit::TestCase

  def dsl_test
    carl = Person.new("Volvo", "58435", 2, "M", 32)
    assert_equal(15.66, carl.evaluate_policy("policy.rb"))
    bea = Person.new("Mercedes", "58937", 16, "F", 47)
    assert_equal(25, bea.evaluate_policy("policy.rb"))
  end

  def bnf_test
    asgn = Logical.new.test("(set a true)")
    assert_equal(true, asgn)
    or1 = Logical.new.test("(or true false)")
    or2 = Logical.new.test("(or true true)")
    or3 = Logical.new.test("(or false false)")
    assert_equal(true, or1)
    assert_equal(true, or2)
    assert_equal(false, or3)
    and1 = Logical.new.test("(and false false)")
    and2 = Logical.new.test("(and true false)")
    and4 = Logical.new.test("(and true true)")
    assert_equal(false, and1)
    assert_equal(false, and2)
    assert_equal(true, and4)
    not1= Logical.new.test("(not true)")
    assert_equal(false, not1)
  end
end
