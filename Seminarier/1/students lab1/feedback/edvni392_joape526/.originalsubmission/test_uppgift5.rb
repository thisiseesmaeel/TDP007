require "test/unit"
require "./uppgift5.rb"

class TestPersonName < Test::Unit::TestCase
    
    def test_simple
        person1 = PersonName.new("Barack", "Obama")
        
        assert_equal("Barack", person1.name)
        assert_equal("Obama", person1.surname)
        assert_equal("Barack Obama", person1.fullname)
        person1.fullname = "Pontus Haglund"
        assert_equal("Pontus", person1.name)
        assert_equal("Haglund", person1.surname)
        assert_equal("Pontus Haglund", person1.fullname)

    end
end
