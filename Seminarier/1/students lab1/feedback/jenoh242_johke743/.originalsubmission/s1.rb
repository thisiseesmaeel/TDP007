###
#1#
###

def n_times(n, &block)
    n.times do block.call end
end

class Repeat
    def initialize(n)
        @n = n
    end

    def each(&block)
        @n.times do block.call end
    end
end

###
#2#
###

def fact(n)
    sum = (1..n).inject(:*)
    return sum
    end

###
#3#
###

def longest_string(text) 
    return text.sort_by { |e| -e.length }[0]
end

###
#5#
###

require('date')

class PersonName
    def initialize (name = "")
        self.fullname = name
    end

    def fullname
        "#{@surname} #{@fname}"
    end

    def fullname=(name)
        @fname, @surname = name.split
    end
end

###
#6#
###

class Person
    attr_accessor :age
    def initialize (fname="", surname="", age=0)
        @name = PersonName.new(fname + " " + surname)
        @age = age
    end

    def name
        @name.fullname
    end

    def birthyear()
        Date.today.year - @age
    end
end

###
#8#
###

class String
    def acronym
        acronym = ""
        self.split.each do | str | acronym += str[0].upcase end
        acronym
    end
end
puts ('Laughs out loud').acronym

###
#9#
###

class Array
    def rotate_left (n=1)
        self.rotate(n)
    end
end

####
#10#
####

def find_user(str)
    /.*USERNAME: *(.*)/.match(str)[1]
end

####
#11#
####

def tagNames(url)
    require 'open-uri.rb'
    siteToSearch = open("http://www.google.com/") { |f| f.read }
    tagFound = siteToSearch.scan(/<[^\s\\]+?>/).uniq
end

puts tagNames("http://www.google.com/")

####
#12#
####

def regnr(regnr)

    match = regnr.scan(/[A-HJ-PR-UW-Z]{3}\d{3}/)
    return match == [] ? false : match[0]

end