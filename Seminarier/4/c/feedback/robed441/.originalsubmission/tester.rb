require 'test/unit'
require './constraint-parser2.rb'
require './constraint_networks.rb'


class TestParse < Test::Unit::TestCase

    def test_adder
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Adder.new(a, b, c)
        a.user_assign(10)
        b.user_assign(5)
        assert_equal(c.value, 15)
        puts "c = "+c.value.to_s
        a.forget_value "user"
        c.user_assign(20)
        assert_equal(c.value, 20)
        assert_equal(a.value, 15)
        puts "a = "+a.value.to_s
      end
      
      def test_multiplier
        a = Connector.new("a")
        b = Connector.new("b")
        c = Connector.new("c")
        Multiplier.new(a, b, c)
        a.user_assign(10)
        b.user_assign(5)
        assert_equal(c.value, 50)
        puts "c = "+c.value.to_s
        a.forget_value "user"
        c.user_assign(20)
        assert_equal(c.value, 20)
        assert_equal(a.value, 4)
        # a should now be 4
        puts "a = "+a.value.to_s
      end
      

    def test_uppgift2
        cp=ConstraintParser.new
        #Testar urpsrungsekvationen (multiplikation samt parenteser)       
        c,f = cp.parse "9*c=5*(f-32)"
        f.user_assign 0
        assert_equal(c.value,-18)
        assert_equal(f.value, 0)
        f.user_assign 100
        assert_equal(c.value, 37)
        #Testar subtraktion samt divison
        c,f = cp.parse "c-10= 2/f"
        f.user_assign 1
        assert_equal(c.value, 12)
        assert_equal(f.value, 1)
        #Testar addition samt divison
        c,f = cp.parse "c+10= f/3"
        f.user_assign 9
        assert_equal(c.value, -7)
        assert_equal(f.value, 9)

        #Does not work
        #Cannot take times with the division
        #c,f = cp.parse "c-1=10/f"
        #c.user_assign 11
        #assert_not_equal(f.value, 1)
        #assert_not_equal(c.value, 11)
         
    end

end