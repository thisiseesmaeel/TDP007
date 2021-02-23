require './constraint-parser.rb'
require 'test/unit'

class TestUppgift < Test::Unit::TestCase
    def test_simple
   
        # Tester enligt exempel
        cp=ConstraintParser.new
        c,f=cp.parse "9*c=5*(f-32)"

        f.user_assign 0
        assert_equal(c.value, -18)

        f.user_assign 100
        assert_equal(c.value, 37)

        ################################

        # Tester med f
        cp=ConstraintParser.new
        c,f=cp.parse "50/c=30*(f+50)"
        f.user_assign 100
        # 50/c = 30*(f+50)
        # c = 50*(30*(100+50))

        assert_equal(c.value, 50*(30*(100+50)))

        f.user_assign -10000
        # c = 50*(30*(-10000+50))

        assert_equal(c.value, 50*(30*(-10000+50)))

        #################################

        # Tester med c
        cp=ConstraintParser.new
        c,f=cp.parse "50/c=30*(f+50)"
        c.user_assign 100

        # 50/100=30*(f+50)
        # f = (50/100)/30-50

        assert_equal(f.value, (50/100)/30-50)

        c.user_assign -10000
        # f = (50/-10000)/30-50
        assert_equal(f.value, (50/-10000)/30-50)     
    end
  end
  