require './u8'
require 'test/unit'

class TestAcronym < Test::Unit::TestCase
  def test_acronym
    assert_equal("LOL", "laugh out loud".acronym)
    assert_equal("DWIM", "Do what I mean!!".acronym)
  end

end

