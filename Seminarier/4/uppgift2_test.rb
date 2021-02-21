require './constraint-parser.rb'
require 'test/unit'

class TestParser < Test::Unit::TestCase
    def test_parser
        cp = ConstraintParser.new
        c, f = cp.parse "9*c=5*(f-32)"

        f.user_assign(0)
        assert_equal(-18, c.value)

        f.user_assign(100)
        assert_equal(37, c.value)

        f.forget_value("user")
        c.user_assign(37)
        assert_equal(98, f.value)

        c.forget_value("user")
        f.user_assign(32)
        assert_equal(0, c.value)
    end
end