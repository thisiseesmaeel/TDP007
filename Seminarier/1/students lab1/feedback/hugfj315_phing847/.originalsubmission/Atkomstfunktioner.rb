require 'date'
#Uppgift 5

#Vi tolkade det som att en person bara kan ha ett förnamn och ett efternamn. Det blir mer eller mindre 
#omöjligt att bestämma vad som är förnamn och vad som är efternamn om en person har flera av dessa annars. 

class PersonName
    def initialize()
    end

    def fullname=(fullname)
        @name = fullname.split(" ")[0]
        @surname = fullname.split(" ")[-1]
        
    end

    def get_full_name()
        return "#{@name} #{@surname}"
    end
end

#Uppgift 6

class Person
    def initialize(name, age)
        @name = name
        @age = age
        @birth_year = Date.today.year() - age
    end
    
    def get_age
        return @age
    end

    def get_birth_year
        return @birth_year
    end

    def set_birth_year(birth_year)
        @age = Date.today.year()-birth_year
        @birth_year = birth_year
    end

    def set_age(age)
        @birth_year = Date.today.year() - age
        @age = age
    end
end


