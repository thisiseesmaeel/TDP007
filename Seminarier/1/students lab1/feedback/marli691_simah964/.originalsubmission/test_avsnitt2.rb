require './avsnitt2'
require 'test/unit'

class TestUppgift < Test::Unit::TestCase
  def test_test
    #Testar PersonName
    name = PersonName.new("Ola", "Olsson")
    assert_equal("Ola Olsson", name.get_fullname)
    name.set_fullname("Ingvar Ingvarsson")
    assert_equal("Ingvar Ingvarsson", name.get_fullname)

    #Testar Person
    person = Person.new("Kalle", "Karlsson", 45)
    assert_equal("Kalle Karlsson", person.name )
    assert_equal(45, person.age)
    assert_equal(1976, person.birthyear)

    #Uppdateras age med birthyear?
    person.birthyear = 2000
    assert_equal(2000, person.birthyear)
    assert_equal(21, person.age)

    #Och vice versa?
    person.age = 100
    assert_equal(100, person.age)
    assert_equal(1921, person.birthyear)
  end
end
