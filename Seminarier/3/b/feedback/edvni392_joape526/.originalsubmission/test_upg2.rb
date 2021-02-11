require './rdparse'
require 'test/unit'

class TestUpg2 < Test::Unit::TestCase
  def test_assignment
    le = LogicExpr.new
    #both
    assert_equal(le.parse("(set a true)"), true)
    assert_equal(le.parse("(set b a)"), true)
    assert_equal(le.parse("(set a false)"), false)
    assert_equal(le.parse("a"), false)
    assert_equal(le.parse("b"), true)

    assert_equal(le.parse("(set a (and true false))"), false)
    assert_equal(le.parse("(set a (or true false))"), true)
  end

  def test_not
    le = LogicExpr.new
    assert_equal(le.parse("(not true)"), false)
    assert_equal(le.parse("(not false)"), true)
  end

  def test_and
    le = LogicExpr.new
    assert_equal(le.parse("(and true false)"), false)
    assert_equal(le.parse("(and false true)"), false)
    assert_equal(le.parse("(and false false)"), false)
    assert_equal(le.parse("(and true true)"), true)
  end

  def test_or
    le = LogicExpr.new
    assert_equal(le.parse("(or true false)"), true)
    assert_equal(le.parse("(or false true)"), true)
    assert_equal(le.parse("(or true true)"), true)
    assert_equal(le.parse("(or false false)"), false)
  end

end
