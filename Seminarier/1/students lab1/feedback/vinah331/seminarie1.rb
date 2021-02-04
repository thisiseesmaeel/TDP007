#Avsnitt 1, upg 1
def n_times(n, &block)
    n.times do block.call
    end
end

class Repeat
    def initialize(times = 0)
        @times = times
    end

    def each(&block)
        @times.times do block.call
        end
    end
end

=begin
n_times(3) { puts "Hello!" }
testresultat = ""
n_times(3) {testresultat += "Hej" }
puts testresultat

do_three = Repeat.new(3)
do_three.each { puts "Hooray!" }
=end

#Avsnitt 1, upg 3
def longest_string(array)
  array.max_by {|element| element.length}
end

#puts longest_string ["apelsin","banan","citron"]
#puts longest_string ["banan","apelsin","citron"]
  
#Avsnitt 2, upg5
class PersonName
    def initialize(name, surname)
        @name = name
        @surname = surname
    end

    def fullname
        @name + " " + @surname
    end

    def fullname=(input_string)
        @name = input_string.split[0]
        @surname = input_string.split[1]
    end
end

#test = PersonName.new("simon", "ahrenstedt")
#puts test.fullname

#avsnitt 2, upg6
class Person
    attr_reader :name, :age, :birthyear

    def initialize(name = "John", surname = "Doe", age = 20)
        @age = age
        @birthyear = Time.new.year - age
        @name = PersonName.new(name, surname)
    end

    def age=(age)
        @age = age
        @birthyear = Time.new.year - age
    end

    def birthyear=(birthyear)
        @age = Time.new.year - birthyear
        @birthyear = birthyear
    end

    def print
        puts @name.fullname 
        puts @age
        puts @birthyear
    end
end


=begin
test = Person.new("Simon", "Ahrenstedt", 30)
test.print
test.age = 15
test.print
test.birthyear = 1995
test.print
=end

#Avsnitt 3, upg 7

class Integer
    def fib
        self == 0 || self == 1 ? self : (self-2).fib + (self-1).fib
    end
end

=begin
puts 0.fib
puts 1.fib
puts 2.fib
puts 3.fib
puts 4.fib
puts 5.fib
puts 6.fib
puts 7.fib
puts 8.fib
puts 9.fib
puts 10.fib
=end

#Avsnitt 3 upg8
class String
    def acronym
        self.split.map(&:chr).join.upcase
        #Gör nedan, vet inte riktigt hur &:chr fungerar labassistent visste inte riktigt heller
        #puts self.split.map{|word| word.chr}.join.upcase
    end
end

=begin
"test ninje turtle".acronym
"Banana konstant boll".acronym
=end

#Avsnitt 4, upg 10
def find_username(input_string)
    #resultat = /(USERNAME: )(\w+)/.match(input_string)
    #resultat.captures[1]
    resultat = /(?<=USERNAME: )(\w+)(\s*\w*)/.match(input_string)
    resultat.captures[0]

end

#puts find_username("asdKJLHghkj asdkjhASDahsd USERNAME: brian asdfkjh skdhfgihsdgf")

#Avsnitt 4, upg 12
def find_regnr(input_string)
    resultat = /([A-HJ-PR-UW-Z]{3}[\d]{2}[A-HJ-PR-UW-Z0-9])/.match(input_string)
    resultat == nil ? false : resultat.captures[0]
end

#puts find_regnr("fgökjfdg ABC123 ökjcgkljfg")
#puts find_regnr("fgökjfdg AKL65B ökjcgkljfg")