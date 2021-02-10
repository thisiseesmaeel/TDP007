class Person

    attr_accessor :score
    def initialize(make, postal_code, license_age, gender, age)
        @make = make
        @postal_code = postal_code
        @license_age = license_age
        @gender = gender
        @age = age

        @score = 0.0
    end

    def license_age(range, value)
        if range === @license_age
            @score += value
        end
    end

    def age(range, value)
        if range === @age
            @score += value
        end
    end

    def multiply(value)
        @score = @score * value
    end

    def evaluate_policy(policy)
        instance_eval(File.read(policy))
        self
    end

    def method_missing(name, *args)
        condition = instance_eval("@#{name} == args[0]")
        if condition
            @score += args[1]
        end
    end

    def to_s
        str = "Score: " + score.to_s
        str
    end
end

#kalle = Person.new("Volvo", "58435", 2, "M", 32)
#kalle.evaluate_policy("policy.rb")

#def age(*args)
#    if args.length == 0
#        return @age
#    else
#        if args[0] === @age
#            @score += args[1]
#        end
#    end
#end
