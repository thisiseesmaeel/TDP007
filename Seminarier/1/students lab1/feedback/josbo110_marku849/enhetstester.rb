require './lösningar'
require 'test/unit'

class TestFaculty < Test::Unit::TestCase
  def test_n_times
    x = []
    #n_times([1, 1, 1]) { x.push(1) }
    assert_equal([1, 1, 1], n_times(3) { x.push(1) })
  end

  def test_repeat
    do_three = Repeat.new(3)
    x = []
    assert_equal([1, 1, 1], do_three.each { x.push(1) })
  end

  def test_longest_string
    assert_equal("apelsin", longest_string(["apelsin", "banan", "citron"]))
    assert_equal("citronpaj", longest_string(["apelsin", "banan", "citronpaj"]))
  end

  def test_personname
    vincent = PersonName.new("Vincent", "Ahlström")
    assert_equal("Vincent", vincent.first_name)
    assert_equal("Ahlström", vincent.last_name)
    vincent.full_name=("Sven Karlsson")
    assert_equal("Sven Karlsson", vincent.full_name)
    assert_equal("Sven", vincent.first_name)
    assert_equal("Karlsson", vincent.last_name)
  end

  def test_person
    vincent = PersonName.new("Vincent", "Ahlström")
    person = Person.new(25, vincent)
    assert_equal(25, person.age)
    person.age=100
    assert_equal(100, person.age)
    assert_equal(1921, person.birth_year)
    person.birth_year=0
    assert_equal(2021, person.age)
    assert_equal(0, person.birth_year)
  end

  def test_fib
    assert_equal(1, Integer(2).fib)
    assert_equal(11, Integer(7).fib)
    assert_equal(7, Integer(5).fib)
  end

  def test_acronym
    assert_equal("LOL", "Laughing out loud".acronym)
  end

  def test_regname
    assert_equal("Brian", regname("USERNAME: Brian"))
    assert_equal"Brian", regname("blBlasdlKVB: Brian")
  end

  def test_regnr
    assert_equal("FMA297", regnr("Min bil heter FMA297."))
    assert_equal("false", regnr("Min bil heter FQA297."))
  end

end


test = TestFaculty.new(1)
