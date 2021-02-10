#!/bin/env ruby
# encoding: utf-8

require 'test/unit'
require './uppg2.rb'

class TestLogicalExpression < Test::Unit::TestCase
=begin
run has two optional parameters a string (str='') that repalces the user input
and a bool (testing=false) that can be set to true in order to return the 
value of the parsered string instead of just printing it, this will also 
disable the reccusive nature of run.
=end
  def test_AND_expression
    test = LogicalExpr.new
    assert_equal(true, test.run('(and true true)', true))
    assert_equal(false, test.run('(and false true)', true))
    assert_equal(false, test.run('(and true false)', true))
    assert_equal(false, test.run('(and false false)', true))
    assert_equal(false, test.run('(and (and true true)(and false true))', true))
    assert_equal(true, test.run('(and (and true true)(and true true))', true))
  end

  def test_OR_expression
    test = LogicalExpr.new
    assert_equal(true, test.run('(or true true)', true))
    assert_equal(true, test.run('(or false true)', true))
    assert_equal(true, test.run('(or true false)', true))
    assert_equal(false, test.run('(or false false)', true))
    assert_equal(true, test.run('(or (or true true)(or false true))', true))
    assert_equal(true, test.run('(or (or true true)(or false true))', true))

  end

  def test_NOT_expression
    test = LogicalExpr.new
    assert_equal(false, test.run('(not true)', true))
    assert_equal(true, test.run('(not false)', true))
    assert_equal(false, test.run('(not (and (or true true)(and true true)))'\
                                 , true))
    assert_equal(true, test.run('(not (or (and false true)(or false false)))'\
                                 , true))
  end

  def test_VAR_expression
    test = LogicalExpr.new
    assert_equal(true, test.run('(set a true)', true))
    #set b false twice
    assert_equal(false, test.run('(set b false)', true))
    assert_equal(false, test.run('(set b false)', true))
    assert_equal(false, test.run('(not a)', true))
    assert_equal(true, test.run('(not a)', true))
    assert_equal(false, test.run('(not a)', true))
    assert_equal(true, test.run('(not a)', true))

    assert_equal(false, test.run('(and a b)', true)) # (and true false)
    assert_equal(true, test.run('(not b)', true))
    assert_equal(true, test.run('(and a b)', true)) # (and true true)
    assert_equal(false, test.run('(not a)', true)) 
    assert_equal(false, test.run('(not b)', true))
    assert_equal(false, test.run('(and a b)', true))# (and false false)
    assert_equal(true, test.run('(not b)', true))
    assert_equal(false, test.run('(and a b)', true))# (and false true)

    assert_equal(true, test.run('(or a b)', true))# (and false true)
    assert_equal(false, test.run('(not b)', true))
    assert_equal(false, test.run('(or a b)', true))# (and false false)
    assert_equal(true, test.run('(not a)', true))
    assert_equal(true, test.run('(or a b)', true))# (and true false)
    assert_equal(true, test.run('(not b)', true))
    assert_equal(true, test.run('(or a b)', true))# (and true true)

    test.run('(set c true)', true)
    test.run('(set d true)', true)

    #(and (and true true) (and true true))
    assert_equal(true, test.run('(and (and a b)(and c d))', true))
    #(or (or true true) (or true true))
    assert_equal(true, test.run('(or (or a b)(or c d))', true))
    test.run('(set d false)', true)
    #(and (and true true) (and true false))
    assert_equal(false, test.run('(and (and a b)(and c d))', true))
    #(or (or true true) (or true true))
    assert_equal(true, test.run('(or (or a b)(or c d))', true))
    test.run('(set a false)', true)
    #(or (or false true) (or true true))
    assert_equal(true, test.run('(or (or a b)(or c d))', true))
    #(and (and false true) (and true false))
    assert_equal(false, test.run('(and (and a b)(and c d))', true))
    test.run('(set b false)', true)
    test.run('(set c false)', true)
    #(and (and false false) (and false false))
    assert_equal(false, test.run('(and (and a b)(and c d))', true))
    #(or (or false false) (or false false))
    assert_equal(false, test.run('(or (or a b)(or c d))', true))
    assert_equal(false, test.run('(or (and a b)(or c d))', true)) 
  end

end
