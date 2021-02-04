
#Uppgift 8
class String

    def acronym
        acronymArray = self.split(' ')
        finalAcronym = ""
        for word in acronymArray do
            finalAcronym += word[0]
        end  
        finalAcronym.upcase()
    end
end

puts "Hej jag heter Svej".acronym

#Uppgift 9
class Array
    def rotate_left(amount=1)
        while amount > 0 do
            item = self[0]
            self.delete_at(0)
            self.append(item)
            amount -= 1
        end
    end
end

newArray = [1,2,3]
newArray2 = [1,2,3]
newArray3 = [1,2,3]
newArray.rotate_left
print newArray
puts
newArray2.rotate_left(3)
print newArray2
puts
newArray3.rotate_left(5)
print newArray3
puts