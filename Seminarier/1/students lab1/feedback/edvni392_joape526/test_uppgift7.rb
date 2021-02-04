require "test/unit"
require "./uppgift7.rb"

class TestInt < Test::Unit::TestCase
    
    def test_simple
        assert_equal(144, 10.fib)
        assert_equal(927372692193078999176, 100.fib)
        assert_equal(2, 1.fib)
        assert_equal(5, 3.fib)
    end
end
