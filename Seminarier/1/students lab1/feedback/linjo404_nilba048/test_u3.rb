require './u3'
require 'test/unit'

class Seminarie1_Test < Test::Unit::TestCase
  def test_longest_string
    assert_equal("apelsin", longest_string(["apelsin", "banan", "citron"]))
    assert_equal("Ismail Safwat", longest_string(["Ahmed", "Ismail", "Ahmed Sikh", "Ismail Safwat"]))
    assert_not_equal("No", longest_string(["yes", "no"]))
  end
end
