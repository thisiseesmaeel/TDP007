require './sem1'
require 'test/unit'

#Testing assignment 1
class TestRepeat < Test::Unit::TestCase
  def test_simple
    @x = 0
    n_times(3) { @x += 2}
    assert_equal(6, @x)
    @x = 0
    @do_three = Repeat.new(3)
    @do_three.each {@x += 4}
    assert_equal(12, @x)
  end
end

#Testing assignment 2
class TestFactorial < Test::Unit::TestCase
  def test_simple
    assert_equal(720, factorial(6))
    assert_equal(false, factorial(-6))
    assert_equal(1, factorial(0))
  end
end

#Testing assignment 5
class TestPersonName < Test::Unit::TestCase
  def test_simple
    @person = PersonName.new("Jan", "Bolin")
    assert_equal("Jan", @person.name)
    assert_equal("Bolin", @person.surname)
    assert_equal("Bolin Jan", @person.fullname)
    @person.fullname = "Jonathan Hedlund"
    assert_equal("Jonathan", @person.name)
    assert_equal("Hedlund", @person.surname)
    assert_equal("Hedlund Jonathan", @person.fullname)
  end
end

#Testing assignment 6
class TestPerson < Test::Unit::TestCase
  def test_simple
    @person = Person.new(21, "Johanna", "Karlsson")
    assert_equal("Karlsson Johanna", @person.name.fullname)
    assert_equal(21, @person.age)
    assert_equal(2000, @person.birthyear)
    @person.age = 10
    assert_equal(10, @person.age)
    assert_equal(2011, @person.birthyear)
   
  end
end

#Testing assignment 7
class TestFib < Test::Unit::TestCase
  def test_simple
    assert_equal(1, 1.fib)
    assert_equal(13, 7.fib)
    assert_equal(false, -3.fib)
  end
end

#Testing assignment 8
class TestAcronym < Test::Unit::TestCase
  def test_simple
    assert_equal("LOL", "Laugh out loud".acronym)
    assert_equal("ROFL", "Rolling on floor laughing".acronym)
  end
end

#Testing assignment 10
class TestUsername < Test::Unit::TestCase
  def test_simple
    assert_equal("Bobo", find_username("username: Bobo"))
    assert_equal("Dream", find_username("PapayaCoconut: Dream"))
  end
end

#Testing assignment 12
class TestRegNr < Test::Unit::TestCase
  def test_simple
    assert_equal("FMA465", regnr("Min bil har regno FMA465"))
    assert_equal("KLO876", regnr("KLO876"))
    assert_equal("HAS78G", regnr("HAS78G"))
    assert_equal(false, regnr("KQU666"))
    assert_equal(false, regnr("ITF999"))
    assert_equal(false, regnr("VOM876"))
    assert_equal(false, regnr("GRK68O"))
  end
end
