#!/bin/env ruby
# coding: iso-8859-1

require 'test/unit'
require 'logger'
require './constraint-parser'
#module PrettyPrint

  class Test_constraint_parser < Test::Unit::TestCase

    #Tests Covered:
    #Equality                       
    #Addition
    #Subtraction
    #Multiplication
    #Division

    #left Hand Side
    #Right Hand Side
    #Assignment of first variable
    #Assignment of second variable
        
    #Parenthesis
    #More than one operator
    
    def test_eq
      cp = ConstraintParser.new
      a, b = cp.parse "a=b"
      a.user_assign 10
      assert_equal(b.value, 10, "equality NWC")
    end
    
    def test_equality_right_assign
      cp = ConstraintParser.new
      a, b = cp.parse "a=b"
      b.user_assign 10
      assert_equal(a.value, 10, "equality with assignment of right hand side variable NWC")
    end

    def test_addition
      cp = ConstraintParser.new
      a, b = cp.parse "a+1=b"
      a.user_assign 1
      assert_equal(b.value, 2, "addition NWC")
    end

    def test_add_w_expr_on_rhs
      cp = ConstraintParser.new
      a, b = cp.parse "a=b+1"
      a.user_assign 1
      assert_equal(b.value, 0, "addition with expression on right hand side NWC")
    end
    
    def test_sub
      cp = ConstraintParser.new
      a, b = cp.parse "a-1=b"
      a.user_assign 1
      assert_equal(b.value, 0, "subtraction NWC")
    end

    def test_sub_w_expr_on_rhs
      cp = ConstraintParser.new
      a, b = cp.parse "a=b-1"
      a.user_assign 1
      assert_equal(b.value, 2, "subtraction with expression on right hand side NWC")
    end
    
    def test_mult
      cp = ConstraintParser.new
      a, b = cp.parse "a*2=b"
      a.user_assign 2
      assert_equal(b.value, 4, "multiplication NWC")
    end

    def test_mult_w_expr_on_rhs
      cp = ConstraintParser.new
      a, b = cp.parse "a=b*2"
      a.user_assign 2
      assert_equal(b.value, 1, "multiplication with expression on right hand side NWC")
    end
    
    def test_div
      cp = ConstraintParser.new
      a, b = cp.parse "a/2=b"
      a.user_assign 4
      assert_equal(b.value, 2, "division NWC")
    end

    def test_div_of_constant
      cp = ConstraintParser.new
      a, b = cp.parse "8/a=b"
      a.user_assign 2
      assert_equal(b.value, 4, "division of constant value NWC" )
    end

    def test_div_w_expr_on_rhs
      cp = ConstraintParser.new
      a, b = cp.parse "a=b/2"
      a.user_assign 2
      assert_equal(b.value, 4, "division with expression on right hand side NWC")
    end

    def test_par
      cp = ConstraintParser.new
      a, b = cp.parse "(a+3)*2=b"
      a.user_assign 1
      assert_equal(b.value, 8, "parenthesis NWC")
    end

    def test_several_operators
      cp = ConstraintParser.new
      a, b = cp.parse "a+3*b=8"
      a.user_assign 5
      assert_equal(b.value, 1, "multiple operator in one expression NWC")
    end
    
    def test_the_big_one
      cp = ConstraintParser.new
      c,f = cp.parse "9*c=5*(f-32)"
      c.user_assign 20
      assert_equal(f.value, 68, "try again...")
    end

  end

#end
