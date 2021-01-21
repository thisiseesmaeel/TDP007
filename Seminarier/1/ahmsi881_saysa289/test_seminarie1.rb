#!/bin/env ruby
# coding: iso-8859-1
require './seminarie1'
require 'test/unit'
require 'open-uri.rb'

class TestSeminarie1 < Test::Unit::TestCase
################################################################
  # Avsnitt 1 Test
  def test_n_times
    x = 0
    n_times(3) { x+=2 }
    assert_equal( x , 6 , "x + 2 does not work")
  end

  def test_Repeat
    do_three = Repeat.new(3)
    s = ""
    do_three.each {s += "hej"}
    assert_equal( s , "hejhejhej")

    s.clear
    do_zero = Repeat.new(0)
    do_zero.each {s += "hej"}
    assert_equal( s , "")
  end

  def test_factorial
    assert( factorial(1) == 1, "1! IS 1")
    assert( factorial(10) == 3628800 , "10! is 3628800")
  end
  
################################################################
  # Avsnitt 2 Test

  def test_PersonName
    mp = PersonName.new("Markus", "Petterson")
    assert( mp.fullname == "Markus Petterson" , "Name isn't Markus Petterson" )
    mp.fullname = "Martin Persson"
    assert( mp.name == "Martin", "name is not Martin" )
    assert( mp.surname == "Persson", "surname is not Persson" )
  end

  def test_Person
    tp = Person.new("Johanna", "Johnsson", 25)
    assert( tp.age == 25, "age is not 25" )
    assert( tp.birthyear == 1996, "birthyear is not 1996" )
    assert( tp.name.fullname == "Johanna Johnsson" )
    tp.birthyear = 1990
    assert( tp.age == 31, "age is not changed to 31" )
  end

################################################################
  # Avsnitt 3 Test

  def test_fib
    assert( 10.fib == 55, "Fibonacci of 10 is not 55" )
    assert( 16.fib == 987, "Fibonacci of 16 is not 987" )
    assert( 1.fib == 1, "Fibonacci of 1 is not 1" )
    assert( 2.fib == 1, "Fibonacci of 2 is not 1" )
  end

  # black box testning
  def test_acronym
    assert_equal( "Laugh out loud".acronym,"LOL", "Laugh out loud should be LOL" )
    assert( "Do what I mean!!".acronym == "DWIM", "Do what I mean!! should be DWIM")
    assert( "".acronym == "", "empty string should result in no acronym")
    assert( "Hello".acronym == "H", "Hello should be H" )
  end

################################################################
  # Avsnitt 3 Test

def test_find_user_name
  assert_equal( find_user_name("bf05 USERNAME: Brian klsas91209"), "Brian" )
  assert_equal( find_user_name("01!\"\#\¤\%\&\/()\=? USERNAME: Magnus_25"), "Magnus_25" )
end

def test_tag_names
  html = open("http://www.google.com/") { |f| f.read }
  tags_arr = tag_names(html)
  assert_equal( tags_arr.class, Array )
  for i in (0..tags_arr.length-1) do
    assert_equal( tags_arr[i].class, Array )
    assert_equal( tags_arr[i][0].class, String )
  end
  assert_equal( tags_arr.uniq, tags_arr )
end

end

