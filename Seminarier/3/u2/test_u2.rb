require "./u2"
require "test/unit"

class Seminarium_3 < Test::Unit::TestCase
  def test_u2
    logicLang = LogicLang.new

    assert_equal(true, logicLang.for_test("(set a true)"))
    assert_equal(true, logicLang.for_test("(or true true)"))
    assert_not_equal(false, logicLang.for_test("(or true true)"))
    assert_equal(false, logicLang.for_test("(and true false)"))
    assert_equal(false, logicLang.for_test("(not true)"))
    assert_equal(true, logicLang.for_test("true"))
    assert_equal(false, logicLang.for_test("false"))
    assert_not_equal(false, logicLang.for_test("true"))
  end
end
