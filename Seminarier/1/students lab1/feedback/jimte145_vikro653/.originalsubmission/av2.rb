#Uppgift 5
class PersonName
    def initialize()
    end

    def getter()
        return "#{@firstname} #{@lastname}"
    end

    def setter(name)
        wordArray = name.split(' ')
        @firstname = wordArray[0]
        @lastname = wordArray[1]
    
    end
end


person = PersonName.new()
person.setter("Michael Lake")
puts person.getter()


#Uppgift 6
require 'date'

class Person
    def initialize(name, age)
        @age = age
        @name = name
        @birthyear
        updateTime()
    end


    # remember to ask about dynamic time changes regarding the age and the current year
    # one solution, create a constant variable that is the starting year
    # use current year as a counter 
    def updateTime()

        currentYear = DateTime.now
        
        @birthyear = currentYear.year - @age #Comment if you want to use static birthyear
        @age = currentYear.year - @birthyear; #@birthyear = 2008 #Uncomment this for a constant birthyear and change year to your' choice
        puts @birthyear
        puts @age
        puts @name.getter()
    end

end

personName = PersonName.new()
personName.setter("Zackarias Ouacha")
person = Person.new(personName, 22)
