require './u3'
require 'test/unit'

class Seminarie1_Test < Test::Unit::TestCase
  def test_longest_string
    assert_equal("apelsin", longest_string(["apelsin", "banan", "citron"]))
  end
end
