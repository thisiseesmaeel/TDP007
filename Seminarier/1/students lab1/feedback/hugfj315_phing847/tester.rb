require './iteratorer'
require './Åtkomstfunktioner'
require 'test/unit'
require './extending_classes'
require './regex'

class TestFaculty < Test::Unit::TestCase

  def test_uppgift2
    #Vi valde assert_equal då equal är striktare än "==". Om testerna går igenom denna testning kan vi vara helt säkra
    #på att allt fungerar precist som vi tänkt.
    assert_equal(120, factorial(5))
    assert_equal(3628800, factorial(10))
    assert_equal(1, factorial(0))
    assert_not_equal(130, factorial(5))
  end

  def test_uppgift3
    assert_equal("hejsigast", longest_string(["hej", "hejsan", "hejsigast", "h"]))
    assert_equal("sixteen", longest_string(["three", "five", "eleven", "sixteen"]))
    assert_not_equal("hej", longest_string(["hejsan", "hej", "h"]))
    #assert_equal("test", longest_string(["abc", "efd", "zzz", "xyz"]))
  end

  GP = PersonName.new()
  PPP = PersonName.new()
  def test_uppgift5
    GP.fullname=("Göran Persson")
    assert_equal("Göran Persson", GP.get_full_name())
    PPP.fullname=("Per Peter Persson")
    assert_equal("Per Persson", PPP.get_full_name())
    PPP.fullname=("Pia Phillipa Palmgren")
    assert_equal("Pia Palmgren", PPP.get_full_name())
  end
  
  G = Person.new(GP, 45)
  def test_uppgift6
    assert_equal(45, G.get_age())
    G.set_birth_year(1999)
    assert_equal(22, G.get_age())
    G.set_age(300)
    assert_equal(1721, G.get_birth_year())
    G.set_birth_year(2022)
    assert_equal(-1, G.get_age())
  end

  def test_uppgift7 
  assert_equal(55, 10.fib())
  assert_equal(354224848179261915075, 100.fib())
  end

  def test_uppgift8
    assert_equal("LOL", "Laugh out loud".acronym())
    assert_equal("JVH5M", "   Jag vill ha  5   MAJS".acronym())
    end

  def test_uppgift10
    assert_equal("Jonas", username_catcher("Hej jag vill ha username: Jonas Tack för mig! 1337"))
    assert_equal("No match", username_catcher("det finns ingen username123: Jonas"))
  end

  def test_uppgift11
    assert_equal([["html"], ["h1"]], tag_names("<html> my_webpage <h1> Welcome </h1> wow vad min websida är bra </html>"))
    assert_equal([["html"], ["head"], ["link"], ["h1"]], tag_names("<html lang='sv'><head><link href='hej.css'/> my_webpage <h1> Welcome </h1> wow vad min websida är bra </html>"))
  end
  
end

