#Uppgift 1

#Iteratorfunktion
def n_times(times, &block)
    counter = 0
    while counter < times 
        block.call()
        counter += 1
    end
end

n_times(3) { puts "Hello!" }

#Klassiterator
class Repeat
    def initialize(number)
        @number = number
    end

    def each(&block)
        counter = 0
        while counter < @number
            block.call()
            counter += 1
        end
    end
end

do_three = Repeat.new(3)

do_three.each { puts "Hooray!" }

#Uppgift 2

#Enradig lösning för fakulteten av 20
puts (1..20).inject{|f, m| f * m}

#Generell funktion för uträkning av valfri fakultet
#result upates everytime entry is incremented, tex. 1*1 * 2 * 3 .....
def factorial(faculty)
    if faculty == 0
        faculty = 1
    end
     
    result = (1..faculty).inject{|result, entry| result * entry}
    return result

end
    
factorial(5)
