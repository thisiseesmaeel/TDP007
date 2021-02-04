require './upg1'
require './upg2'
require './upg5'
require './upg6'
require './upg7'
require './upg8'
require './upg10'
require './upg12'
require 'test/unit'

class TestUpg1 < Test::Unit::TestCase
  def test_n_times_positive()
    l = 0
    n_times(3){l += 1}
    assert_equal(3, l)
    
    l = 0
    n_times(1000){l += 1}
    assert_equal(1000, l)
  end
  
  def test_n_times_zero()
    l = 0
    n_times(0){l += 1}
    assert_equal(0, l)
  end

  def test_Repeat()
    do_three = Repeat.new(3)
    l = 0
    do_three.each { l += 1 }
    assert_equal(3, l)
    
  end
end

class TestUpg2 < Test::Unit::TestCase
  def test_fac()
    assert_equal(6, fac(3))
    assert_equal(1, fac(0))
    assert_equal(3628800, fac(10))
  end
end


class TestUpg5 < Test::Unit::TestCase
  def test_PersonName()
    p1 = PersonName.new()
    assert_equal(" ", p1.fullname)
    
    p1.fullname = "Lonna Lindsay"
    assert_equal("Lonna Lindsay", p1.fullname)
  end
  
  def test_empty_person()
    p1 = PersonName.new()
    assert_equal(" ", p1.fullname)
  end
  
end

class TestUpg6 < Test::Unit::TestCase
  def test_empty_Person()
    p1 = Person.new()
    assert_equal(" ", p1.name.fullname)
    assert_equal(0, p1.age)
    assert_equal(2021, p1.birthyear)
  end
  
  def test_Person()
    p1 = Person.new("Lonna", "Lindsay", 10)
    assert_equal("Lonna Lindsay", p1.name.fullname)
    assert_equal(10, p1.age)
    assert_equal(2011, p1.birthyear)
  end

   def test_change_age()
    p1 = Person.new("Lonna", "Lindsay", 10)

    p1.age = 21
    assert_equal(2000, p1.birthyear)
    assert_equal(21, p1.age)
   end

   def test_change_birthyear()
    p1 = Person.new("Lonna", "Lindsay", 10)
    p1.birthyear = 2000
    assert_equal(2000, p1.birthyear)
    assert_equal(21, p1.age)
   end
   
end

class TestUpg7 < Test::Unit::TestCase
  def test_fib()
    assert_equal(1, 1.fib)
    assert_equal(1, 2.fib)
    assert_equal(2, 3.fib)
    assert_equal(3, 4.fib)
    assert_equal(5, 5.fib)
  end
  
end

class TestUpg8 < Test::Unit::TestCase
  def test_acronym()
    assert_equal("LOL", "Laugh out loud".acronym)
    assert_equal("DWIM", "Do what I mean!!".acronym)
    assert_equal("D", "D".acronym)
    assert_equal("", "".acronym)
    assert_equal("&", "&Hello".acronym)
    
  end
  
end

class TestUpg10 < Test::Unit::TestCase
  def test_username()
    assert_equal("Brian", username("udfsdfs: Brian"))
    assert_equal("Hadi", username("%\dudfsdfs: Hadi"))
    assert_equal("Brian", username("udf sdfs: Brian"))
  end
  
end

class TestUpg12 < Test::Unit::TestCase
  def test_regnr()
    assert_equal("FMA297", regnr("Min bil heter FMA297."))
    assert_equal("FMA297", regnr("Min bil heter FMA29732323232."))
    assert_equal("FMA297", regnr("Min bil heter FMA297MKHUHU."))
    assert_equal("FFF78F", regnr("FFF78F"))

    assert_equal(false, regnr("XQT784"))
    assert_equal(false, regnr("FFF78O"))
    assert_equal(false, regnr("FFa785"))
    assert_equal(false, regnr("FFF78k"))
    
  end
  
end
