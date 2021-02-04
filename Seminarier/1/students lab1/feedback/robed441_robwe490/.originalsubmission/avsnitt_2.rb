require 'date'

#uppgift 5:
class PersonName
    def initialize(name, surname)
      @name = name
  
      @surname = surname
    end
    
    def get_fullname
      "#{@name} #{@surname}"
    end

    def set_fullname(fullname)
        @name = fullname.split(/ /, 0)[0]

        @surname = fullname.split(/ /, 0)[1]
    end
  end

#uppgift 6:
class Person    
    def initialize(name, surname, age, birthyear)
      @date = Date.today

      @name = PersonName.new(name, surname)
      
      @age = age

      if @date.year >= birthyear
        @birthyear = birthyear
      else
        puts "Kommer du från framtiden? (födelseår är efter: #{@date.year}  vilket är omöjligt) Korrigerar fördelseår efter ålder"
        @birthyear = @date.year - @age

      end

      if @birthyear + @age != @date.year
        if @birthyear + @age + 1 != @date.year
            puts "Åldern och fördelsedatumet stämmer inte överens. Korrigerar ålder efter födelseår."

            @age = @date.year - @birthyear 
        end
      end
    end
  
    def get_age
        "#{@age}"
    end
    
    def get_birthyear
        "#{@birthyear}"
    end

    def set_age(input_age)

        @birthyear = @date.year - input_age

        @age = input_age
    end

    #En person kan vara tex 19 år under år 2021 men vara född 2001. Personen har inte fyllt år. 
    def set_birthyear(input_birthyear)
        if @date.year >= input_birthyear
            birth_diffrence = @birthyear - input_birthyear

            @age = @age + birth_diffrence
            
            @birthyear = input_birthyear

        else
            puts "Kommer du från framtiden?"
        end
    end
  end