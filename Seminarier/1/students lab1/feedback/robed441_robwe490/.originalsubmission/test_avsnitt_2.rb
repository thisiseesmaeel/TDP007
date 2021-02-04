require './avsnitt_2'
require 'test/unit'

class TestFaculty < Test::Unit::TestCase
  def test_PersonName
    personname = PersonName.new('sven', 'svenne')

    assert_equal("sven svenne", personname.get_fullname)

    personname.set_fullname('svenne sven')
    assert_equal("svenne sven", personname.get_fullname)

  end

  def test_person
    person = Person.new('sven', 'svenne', 20, 2000)
    assert_equal("20", person.get_age)
    assert_equal("2000", person.get_birthyear)

    person.set_age(25)
    assert_equal("25", person.get_age)
    assert_equal("1996", person.get_birthyear)

    person.set_birthyear(2002)
    assert_equal("19", person.get_age)
    assert_equal("2002", person.get_birthyear)

    #programmet kommer upptäcka felet och ge personen en giltig ålder
    person = Person.new('sven', 'svenne', 20, 2002)
    assert_equal("19", person.get_age)
    assert_equal("2002", person.get_birthyear)

    #programmet kommer upptäcka felet och ge personen en giltig ålder
    person = Person.new('sven', 'svenne', 300000000000, 2002)
    assert_equal("19", person.get_age)
    assert_equal("2002", person.get_birthyear)

    #programmet kommer upptäcka felet och ge personen ett giltig födelseår
    person = Person.new('sven', 'svenne', 20, 2022)
    assert_equal("20", person.get_age)
    assert_equal("2001", person.get_birthyear)
  end
end