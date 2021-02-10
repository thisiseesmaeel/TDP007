require 'test/unit'
require './uppgift1.rb'

class TestParse < Test::Unit::TestCase

    def test_uppgift1
        ## Mycket bra att ni har skrivit de första 2 testerna!!
        #Test that the Volvo rule works
        p1_volvo = Person.new("Volvo","M", 5, 32, 58435)    
        p2_volvo = Person.new("BMW","M", 5, 32, 58435)
        assert_equal(p1_volvo.points, 18.0)    
        assert_equal(p2_volvo.points, 15.0)

        #Test that the male license years rule works
        p1_ruleyears = Person.new("Volvo","F", 2, 32, 58435)    
        p2_ruleyears = Person.new("Volvo","M", 2, 32, 58435)
        assert_equal(p1_ruleyears.points, 17.4)
        assert_equal(p2_ruleyears.points, 15.66)
        
        #Test that licenseyears makes a difference
        p1_licenseyears = Person.new("Volvo","M", 10, 32, 58435)
        p2_licenseyears = Person.new("Volvo","M", 17, 32, 58435)      
        assert_equal(p1_licenseyears.points, 18)
        assert_equal(p2_licenseyears.points.round(2), 18.6)
        
        #Test that brand makes a difference
        p1_brand = Person.new("Fiat","M", 2, 32, 58435)
        p2_brand = Person.new("BMW","M", 2, 32, 58435)
        assert_equal(p1_brand.points, 11.25)
        assert_equal(p2_brand.points, 13.05)

        #Test that gender doesn't make a difference 
        p1_gender = Person.new("Volvo","F", 5, 32, 58435)
        p2_gender = Person.new("Volvo","M", 5, 32, 58435)
        assert_equal(p1_gender.points, p2_gender.points)

        #Test that postalcode makes a difference
        p1_postalcode = Person.new("Volvo","M", 2, 32, 58435)
        p1_postalcode = Person.new("Volvo","M", 2, 32, 58937) 
        assert_equal(p1_brand.points, 11.25)
        assert_equal(p2_brand.points, 13.05)
    end

end
