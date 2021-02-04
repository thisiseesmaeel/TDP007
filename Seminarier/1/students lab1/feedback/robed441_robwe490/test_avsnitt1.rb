require './uppgift1'
require './uppgift2'
require './uppgift3'
require './uppgift4'
require 'test/unit'

class TestFaculty < Test::Unit::TestCase
	def test_n_times
		assert_equal(3, n_times(3) { puts "Hello!" }, "puts 'Hello!' 3 times")
		assert_equal(0, n_times(0) { puts "Hello!" }, "no puts (see test results)")
		assert_equal(-1, n_times(-1) { puts "Hello!" }, "no puts (see test results)")
	end
	
	def test_repeat
		assert_equal(3, (Repeat.new(3)).each { puts "Hooray!" }, "puts 'Hooray!' 3 times")
		assert_equal(0, (Repeat.new(0)).each { puts "Hooray!" }, "no puts (see test results)")
		assert_equal(-1, (Repeat.new(-1)).each { puts "Hooray!" }, "no puts (see test results)")
	end
	
	def test_factorial
		assert_equal(2432902008176640000, factorial(20), "factorial of 20")
		assert_nil(factorial(0), "returns nothing")
		assert_nil(factorial(-1), "returns nothing")
	end
	
	def test_longest_string
		assert_match("apelsin", longest_string(["apelsin", "banan", "citron"]), "returns longest string")
		assert_match("loooong1", longest_string(["short", "loooong1", "loooong2"]), "multiple strings with same length, picks the first one")
		assert_match("one", longest_string(["one"]), "returns the only element")
		assert_empty(longest_string([]), "returns empty string")
	end
	
	def test_find_it
		assert_match("apelsin", find_it(["apelsin", "banan", "citron"]) { |a,b| a.length > b.length }, "returns longest string")
		assert_match("banan", find_it(["apelsin", "banan", "citron"]) { |a,b| a.length < b.length }, "returns shortest string")
		
		assert_match("ananas", find_it(["banan", "apelsin", "ananas", "citron"]) { |a,b| a < b }, "returns first alphabetical string")
		assert_match("1", find_it(["1", "2", "3", "4"]) { |a,b| a < b }, "returns smallest number string")
		
		assert_match("loooong1", find_it(["short", "loooong1", "loooong2"]) { |a,b| a.length > b.length }, "multiple strings with same length, picks the first one")
		assert_match("one", find_it(["one"]) { |a,b| a.length > b.length }, "returns the only element")
	end
end

