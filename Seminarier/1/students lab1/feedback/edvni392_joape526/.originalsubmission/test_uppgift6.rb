require "test/unit"
require "./uppgift6.rb"

class TestPerson < Test::Unit::TestCase
    
    def test_simple
        person1 = Person.new("Barack", "Obama", 59)
        
        assert_equal("Barack", person1.name)
        assert_equal("Obama", person1.surname)
        assert_equal("Barack Obama", person1.fullname)
        assert_equal(1962, person1.year)
        person1.age = 29
        assert_equal(29, person1.age)
        assert_equal(1992, person1.year)

        person1.fullname = "Pontus Haglund"
        assert_equal("Pontus", person1.name)
        assert_equal("Haglund", person1.surname)
        assert_equal("Pontus Haglund", person1.fullname)
        assert_equal(1992, person1.year)
        person1.year = 1881
        assert_equal(140, person1.age)

    end
end
