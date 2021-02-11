require './upg1.rb'
require 'test/unit'

class TestUppgift < Test::Unit::TestCase
    def test_simple
   
        #Testar med policy.rb
        p = Person.new("Volvo","58937",2,"M",32)
        assert_equal(p.evaluate_policy('./policy.rb'), 25.38)

        p = Person.new("BMW","58726",10,"K",19)
        assert_equal(p.evaluate_policy('./policy.rb'), 18)

        #Testar med policy2.rb (andra värden och annorlunda format)
        p = Person.new("Volvo","58937",0,"M",99)
        assert_equal(p.evaluate_policy('./policy2.rb'), 24.84)

        p = Person.new("BMW","58726",18,"K",18)
        assert_equal(p.evaluate_policy('./policy2.rb'), 19.3)
    end
  end
  