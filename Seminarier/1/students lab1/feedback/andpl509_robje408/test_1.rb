require './1'
require 'test/unit'

class Test1 < Test::Unit::TestCase
  def test_n_times
    n_times_array = Array.new()
    n_times(3) {n_times_array << "Hello"}
    assert_equal(n_times_array, Array.new(3, "Hello"))
  end

  def test_repeat
    test_repeat = Repeat.new(3)
    repeat_array = Array.new()
    test_repeat.each{repeat_array << "Hello"}
    assert_equal(repeat_array, Array.new(3, "Hello"))
  end

  def test_find_longest
    assert_equal(find_longest(["apelsin", "banan", "citron"]), "apelsin")
  end

  def test_person_name
    name = PersonName.new "Jens", "Ohrnell"
    assert_equal(name.fullname, "Jens Ohrnell")
    name.fullname="Johannes Kettu"
    assert_equal(name.fullname, "Johannes Kettu")
  end

  def test_person
    person = Person.new 23 , "Jens", "Ohrnell"
    assert_equal(person.name, "Jens Ohrnell")
    assert_equal(person.age, 23)
    assert_equal(person.birthyear, DateTime.now.year - 23)
    person.birthyear = -1
    assert_equal(person.age, DateTime.now.year + 1)
    person.age = 0
    assert_equal(person.birthyear, DateTime.now.year)
  end

  def test_integer
    fib_seq = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]
    for i in 1..15
      assert_equal(i.fib, fib_seq[i - 1])
    end
  end

  def test_string
    assert_equal("Laugh out loud".acronym, "LOL")
    assert_equal("".acronym, "")
    assert_equal("Laugh7362 274 lo!ud".acronym, "L2L")
  end

  def test_find_username
    assert_equal(find_username("sdaoijsdbbUSERNAME: Jens"), "Jens")
    assert_equal(find_username("difjsdoifjsAAAsdadAUIuo: Jens"), "Jens")
    assert_equal(find_username("d2189321Asa   .. .////dadAUIuo: Jens"), nil)
  end

  def test_regnr
    assert_equal(regnr("ABC123"), "ABC123")
    assert_equal(regnr("asjdioajis FGS675 asidjaoi 2219 wjeio"), "FGS675")
    assert(!regnr("asjdioajis"))
    assert(!regnr("A2"))
  end
end
