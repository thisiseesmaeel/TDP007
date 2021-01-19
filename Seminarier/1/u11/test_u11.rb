# coding: utf-8
require './u11'
require 'test/unit'

class TestRegnr < Test::Unit::TestCase
  def test_regnr
    assert_equal("FMA297", regnr("Min bil heter FMA297."))
    assert_not_equal("min bil", regnr("min bil heter LUL909"))
    assert_equal(false, regnr("aölkjkldf"))
  end
end
