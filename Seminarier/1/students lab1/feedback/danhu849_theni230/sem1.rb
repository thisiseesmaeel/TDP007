
require 'date'

# AVSNITT 1, Upg. 1
# executes a block num times
def n_times(num, &block)
	num.times {block.call}
end

# repeater class that executes a block num times
class Repeat
	def initialize(num)
		@repetitions = num
	end

	def each(&block)
		@repetitions.times {block.call}
	end
end


# AVSNITT 1, Upg. 2
puts (1..20).inject {|prod, x| prod * x}

# returns the factorial of a number
def factorial(num)
	return 1 if num == 0
	(1..num).inject {|prod, x| prod * x}
end


# AVSNITT 2, Upg. 5
# Person name class with name and surname
class PersonName
	def initialize(name, surname)
		@name = name
		@surname = surname
	end

	def fullname()
		"#{@surname} #{@name}"
	end

	def fullname=(fullname)
		@name = fullname.split[0]
		@surname = fullname.split[1]
	end
end


# AVSNITT 2, Upg. 6
# Person class with name, surname, age, and birthyear 
class Person
	def initialize(name = "name", surname = "surname", age = 0)
		@age = age
		@birthyear = DateTime.now.year - age
		@name = PersonName.new(name, surname)
	end

	def birthyear
		@birthyear
	end

	def age
		@age
	end

	def birthyear=(birthyear)
		@age = DateTime.now.year - birthyear
		@birthyear = birthyear
	end

	def age=(age)
		@age = age
		@birthyear = DateTime.now.year - age
	end
end


# AVSNITT 3, Upg. 7
class Integer
	# returns the n:th number in the Fibonacci sequence
	def fib
		return 1 if self == 1 or self == 2
		return (self - 1).fib + (self - 2).fib
	end
end


# AVSNITT 3, Upg. 8
class String
	# returns capitalized acronym of the string
	def acronym
		arr = self.split
		acronym = ""
		arr.each {|word| acronym += word[0].upcase}	
		return acronym
	end
end


# AVSNITT 4, Upg. 10
# finds and returns a username from a string 
def get_name(string)
	/([a-zA-Z]+: )(.+)/ =~ string
	$2
end


# AVSNITT 4, Upg. 12
# finds and returns a registration number from a string 
def regnr(string)
	return false if (/([A-HJ-PR-UW-Z]{3}[0-9]{3})/ =~ string) == nil
	return $1
end

