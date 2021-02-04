#Uppgift 7

class Integer
    def fib()
        first = 0
        second = 1
        temp = 0
        (self-1).times do
            temp = first + second
            first = second
            second = temp
        end
        return second
    end
end

#Uppgift 8

class String
    def acronym() 
        sentence = self.split()
        acronym = ""
        for word in sentence
            letter = word[0].upcase()
            acronym += letter
        end
        return acronym
    end
end
            