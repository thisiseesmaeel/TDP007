class Person
    
    #Klassen initsieras med olika parametrar.
    def initialize(car_model, zip_code, years_with_license, gender, age)
        @car_model = car_model
        @zip_code = zip_code
        @years_with_license = years_with_license
        @gender = gender
        @age = age
        @score
    end

    #Filinläsning
    def evaluate_policy(filename)
        instance_eval(File.new(filename).read())
        @score
    end

    def calc(*args)
        conditions = args[0..-2]
        score = args[-1]
        @score = eval(@score.to_s + score.to_s) if conditions.all?
    end

    #Tar in 3 prametrar och kollar om de finns i policy filen 
    def method_missing(name, cond, score)
        if (cond.include?(instance_variable_get("@#{name}")))
            @score = eval(@score.to_s + score.to_s)
        end
    end
end

#skapar en new ny perosn

kalle = Person.new("Volvo", "58435", 2, "M", 32)
puts kalle.evaluate_policy("policy.rb")

sara = Person.new("BMW", "58726", 4, "F", 22)
puts sara.evaluate_policy("policy.rb")