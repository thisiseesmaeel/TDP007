#!/bin/env ruby
# coding: iso-8859-1
require "test/unit"
require "./person.rb"

class Person_Test < Test::Unit::TestCase  
  
  def test_evaluate_policy
    test_person = Person.new( zip:"58647", d_license:"2", sex:"Man", age:"20" )
    assert_equal( (7+3+4+1+2.5+5)*1.2*0.9, test_person.evaluate_policy( "policy.rb" ) )

    test_person = Person.new( car:"Citroen", zip:"46286", d_license:"3", sex:"Kvinna", age:"70", children:"4" )
    assert_equal( 4+7+4+1+4+3, test_person.evaluate_policy( "policy.rb" ) )

    test_nil = Person.new
    assert_equal( (7+0+3+1+2.5+5)*0.9 , test_nil.evaluate_policy( "policy.rb" ) )
    
    test_error = Person.new( car:"Lamborghinin", zip:"9999", d_license:"dog", sex:"unknown", age:"5680", children:"multiple" )
    assert_equal( 0, test_error.evaluate_policy( "policy.rb" ) )
    
    test_person = Person.new( zip:"32845", car:"Ferrari", d_license:"98", sex:"Kvinna", age:"116" )
    assert_equal( (8+4+5+1+1+5)*0.5, test_person.evaluate_policy( "policy.rb" ) )

    test_person = Person.new( d_license:"12", zip:"43529", car:"Opel", sex:"Man", age:"46" )
    assert_equal( (4+1+4.5+1+5+5)*0.8, test_person.evaluate_policy( "policy.rb" ) )
  end
  



end
