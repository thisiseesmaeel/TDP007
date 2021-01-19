require './u5+6'
require 'test/unit'

class Seminarie1_Test < Test::Unit::TestCase


  def test_fullname
    assert_equal("Safwat Ismail", PersonName.new("Ismail", "Safwat").fullname)
  end

  def test_fullname=
    person_name = PersonName.new("Ismail", "Safwat")
    person_name.fullname="Ismail Safwat"
    assert_equal("Safwat Ismail", person_name.fullname)
  end

  def test_Person
    person = Person.new("Ahmed", "Sikh")
    assert_equal("Sikh Ahmed", person.name.fullname)
    assert_equal("Ahmed", person.name.name)
    assert_equal("Sikh", person.name.surname)
    assert_equal(DateTime.now.to_date.year - person.age, person.birthyear)
    person.age = 25
    assert_equal(DateTime.now.to_date.year, person.birthyear + person.age)
    assert_equal(25, person.age)
    assert_equal(1996, person.birthyear)
  end
end
