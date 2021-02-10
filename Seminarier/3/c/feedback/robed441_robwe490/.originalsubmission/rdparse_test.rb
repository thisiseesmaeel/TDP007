require './rdparse'
require 'test/unit'

class Test1 < Test::Unit::TestCase
    def setup 
        @parser = LogExp.new.logexParser
    end

    def test_assign
        assert_false @parser.parse("(set var false)").eval
        assert_true @parser.parse("(set var true)").eval
    end

    def test_expr
        @parser.parse("(set var true)").eval

        assert_true @parser.parse("(or true true)").eval
        assert_true @parser.parse("(or true false)").eval
        assert_true @parser.parse("(or false true)").eval
        assert_false @parser.parse("(or false false)").eval
        assert_true @parser.parse("(or var false)").eval

        assert_true @parser.parse("(and true true)").eval
        assert_false @parser.parse("(and true false)").eval
        assert_false @parser.parse("(and false true)").eval
        assert_false @parser.parse("(and false false)").eval
        assert_true @parser.parse("(and true var)").eval
        assert_false @parser.parse("(and var false)").eval

        assert_false @parser.parse("(not true)").eval
        assert_true @parser.parse("(not false)").eval
        assert_false @parser.parse("(not var)").eval

        assert_true @parser.parse("(and (or false true) true)").eval
        assert_true @parser.parse("(or (not false) true)").eval
        assert_false @parser.parse("(not (and true var))").eval
        assert_true @parser.parse("(and (or (not false) false) var)").eval
    end

    def test_term
        assert_true @parser.parse("true").eval
        assert_false @parser.parse("false").eval
    end

    def test_var
        @parser.parse("(set var true)").eval
        assert_true @parser.parse("var").eval
        @parser.parse("(set var false)").eval
        assert_false @parser.parse("var").eval
    end
end
