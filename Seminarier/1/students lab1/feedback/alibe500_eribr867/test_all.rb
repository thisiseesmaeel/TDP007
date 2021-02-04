#!/bin/env ruby

require './uppg1'
require './uppg2'
require './uppg5'
require './uppg6'
require './uppg8'
require './uppg9'
require './uppg10'
require './uppg11'
require 'test/unit'
require 'open-uri.rb'

class TestOne < Test::Unit::TestCase
  def test_simple()
    # Testing uppg1
    test = ""
    n_times(3) { test += "Hello!" }
    assert_equal("Hello!Hello!Hello!", test)

    test = 0
    n_times(3) { test += 2 }
    assert_equal(6, test)

    test = ""
    do_three = Repeat.new(3)
    do_three.each { test += "Hooray!" }
    assert_equal("Hooray!Hooray!Hooray!", test)

    test = 0
    do_three.each { test += 2 }
    assert_equal(6, test)
  end
end

class TestTwo < Test::Unit::TestCase
  def test_simple()
    # Testing uppg2
    assert_equal(1, factorial(0))
    assert_equal(1, factorial(1))
    assert_equal(120, factorial(5))
    assert_equal(2432902008176640000, factorial(20))
  end
end

class TestFive < Test::Unit::TestCase
  def test_simple()
    # Testing uppg5
    person1 = PersonName.new("My", "Name")
    assert_equal("My Name", person1.fullname)
    
    person1.fullname=("Another Name")
    assert_equal("Another Name", person1.fullname)
  end
end

class TestSix < Test::Unit::TestCase
  def test_simple()
    person1 = Person.new()
    assert_equal(" ", person1.get_fullname)
    assert_equal(0, person1.get_age)
    assert_equal(2021, person1.get_birthyear)

    person2 = Person.new("En", "Person", 30)
    assert_equal("En Person", person2.get_fullname)
    assert_equal(30, person2.get_age)
    assert_equal(1991, person2.get_birthyear)
    
    person1.set_name("Example")
    assert_equal("Example ", person1.get_fullname)
    person1.set_name("Example Name")
    assert_equal("Example Name", person1.get_fullname)
    person1.set_name("Example Name Two")
    assert_equal("Example Name Two", person1.get_fullname)

    person1.set_age(33)
    assert_equal(33, person1.get_age)
    assert_equal(1988, person1.get_birthyear)

    person1.set_birthyear(2000)
    assert_equal(21, person1.get_age)
    assert_equal(2000, person1.get_birthyear)
  end
end

class TestEight < Test::Unit::TestCase
  def test_simple()
    #Testing uppg8
    assert_equal("LOL", "Laugh out loud".acronym)
    assert_equal("DWIM", "Do what I mean".acronym)
    assert_equal("YOLO", "You only live once".acronym)
    assert_equal("YOL9", "You only live 9".acronym)
  end
end

class TestNine < Test::Unit::TestCase
  def test_simple()
    #Testing uppg9
    assert_equal([2, 3, 1], [1, 2, 3].rotate_left)
    assert_equal([3, 1, 2], [1, 2, 3].rotate_left(2))
    assert_equal([1, 2, 3], [1, 2, 3].rotate_left(3))

    assert_equal([2, 3, 4, 1], [1, 2, 3, 4].rotate_left)
    assert_equal(["2", "3", "1"], ["1", "2", "3"].rotate_left)
  end
end

class TestTen < Test::Unit::TestCase
  def test_simple()
    #Testing uppg10
    assert_equal("Brian", get_name("USERNAME: Brian"))
    assert_equal("Brian", get_name("NAME: Brian"))
    assert_equal("Brian", get_name("dog: Brian"))
  end
end

class TestEleven < Test::Unit::TestCase
  def test_simple()
    #Testing uppg11
    html =  URI.open("http://tdp003-2020-robed441.kubernetes-public.it.liu.se/") { |f| f.read }
    
    tags = ["!DOCTYPE", "html", "head", "meta", "script", "link", "title", "body", "header", "ul", "h1", "img", "li", "a", "section", "h2", "div", "p", "h3", "br", "footer"]

    assert_equal(tags, tag_names(html))

    

    html =  URI.open("http://www.google.com/") { |f| f.read }

    tags =  ["!doctype", "html", "head", "meta", "title", "script", "=b){var", "style", "body", "div", "nobr", "b", "a", "u", "span", "center", "br", "img", "form", "table", "tr", "td", "input", "p"]

    assert_equal(tags, tag_names(html))
  end
end
