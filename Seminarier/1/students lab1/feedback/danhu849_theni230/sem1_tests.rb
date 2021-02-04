
require 'test/unit'
require './sem1.rb'

class Tests_Avs1_Upg1 < Test::Unit::TestCase
	def test_n_times
		assert(n_times(0) {puts "0 times"} == 0, "0 iterations")
		assert(n_times(4) {puts "4 times"} == 4, "4 iterations")
	end

	def test_repeat
		assert(Repeat.new(0).each {puts "Repeat 0 times"} == 0, "0 iterations")
		assert(Repeat.new(4).each {puts "Repeat 4 times"} == 4, "4 iterations")
	end
end 


class Tests_Avs1_Upg2 < Test::Unit::TestCase
	def test_factorial
		assert(factorial(0) == 1, "0!")
		assert(factorial(20) == 2432902008176640000, "20!")
	end
end 


class Tests_Avs2_Upg5 < Test::Unit::TestCase
	def test_person_name
		person = PersonName.new("Byggare", "Bob")
		assert(person.fullname == "Bob Byggare", "fullname getter")
		
		person.fullname = "Dora Explorer"
		assert_equal(person.fullname, "Explorer Dora", "fullname setter")
	end
end 


class Tests_Avs2_Upg6 < Test::Unit::TestCase
	def test_person
		person = Person.new("Byggare", "Bob", 35)
		assert(person.age == 35, "age getter")
		assert(person.birthyear == 1986, "birthyear getter")
		
		person.age = 37
		assert(person.birthyear == 1984, "age setter")

		person.birthyear = 1989
		assert(person.age == 32, "birthyear setter")

		person2 = Person.new()
		assert(person2.age == 0, "default age")
		assert(person2.birthyear == 2021, "default birthyear")
	end
end 


class Tests_Avs3_Upg7 < Test::Unit::TestCase
	def test_fib
		assert(1.fib == 1, "1st fib number")
		assert(2.fib == 1, "2nd fib number")
		assert(7.fib == 13, "7th fib number")
	end
end 


class Tests_Avs3_Upg8 < Test::Unit::TestCase
	def test_acronym
		assert("laughing out loud".acronym == "LOL", "3 words")
		assert("Do what I mean!!".acronym == "DWIM", "4 words with punctuation")
		assert("".acronym == "", "empty string")
	end
end 


class Tests_Avs4_Upg10 < Test::Unit::TestCase
	def test_get_name
		assert(get_name("USERNAME: Brian") == "Brian", "")
		assert(get_name(".dgfg #¤%&/()} USERNAME: Brian") == "Brian", "")
		assert(get_name(".dgfg #¤%&/()} USERNAME: Brian ¤%&/(") != "Brian", "")
	end
end 


class Tests_Avs4_Upg12 < Test::Unit::TestCase
	def test_regnr
		assert(regnr("ASD567") == "ASD567", "standalone regnr")
		assert(regnr("Hej detta är URO852 min bil!") == "URO852", "regnr in sentance")
		assert(!regnr("XQT784"), "invalid regnr")
	end
end 