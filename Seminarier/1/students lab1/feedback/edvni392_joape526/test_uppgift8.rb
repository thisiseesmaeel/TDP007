require "test/unit"
require "./uppgift8.rb"

class TestStr < Test::Unit::TestCase
    
    def test_simple
        assert_equal("LOL", "Laugh out loud!!".acronym)
        assert_equal("LOL!", "Laugh out loud !!".acronym)
        assert_equal("DWIM", "Do what I mean!!".acronym)
        assert_equal("HUD", "how u doin".acronym)
        assert_equal("HUD", "how u        doin".acronym)
        assert_equal("L33T", "l 3 3 t".acronym)
    end
end
