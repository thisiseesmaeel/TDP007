require './avsnitt4.rb'
require 'test/unit'

class TestUppgift < Test::Unit::TestCase
  def test_simple
    assert_equal(get_username("USERNAME: Brian"), "Brian")
    assert_equal(get_username("UsErNaMe: Brian"), "Brian")
    assert_equal(get_username("Username:Brian"), "Brian")

    assert_equal(regnr("Min bil heter FMA297 "), "FMA297")
    assert_equal(regnr("Min bil heter FMA297."), "FMA297")
    assert_equal(regnr("Min bil heter FMA297"), "FMA297")
    assert_equal(regnr("Min bil heterFMA297."), false)
    assert_equal(regnr("Men min bil heter QTB987"), false)
    assert_equal(regnr("Och min heter ABC12 3"), false)
    assert_equal(regnr("ABC1234"), false)
    assert_equal(regnr("ABCD123"), false)
  end
end
