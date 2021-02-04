require "test/unit"
require "./uppgift3.rb"

class TestFaculty < Test::Unit::TestCase
    def test_simple
    assert_equal("apelsin", 
        longest_string(["apelsin", "banan", "citron"]))

    assert_equal("bananapelsin", 
        longest_string(["apelsin", "banan", "citron", "bananapelsin"]))

    assert_equal("banan", 
        longest_string(["banan"]))

        assert_equal("banancitron", 
        longest_string(["apelsin", "banancitron", "citron"]))
    end


  end
