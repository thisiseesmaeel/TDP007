class Person
    def initialize(brand,gender,licence_years, age, postal_code)
        @brand = brand
        @postal_code = postal_code
        @licence_years = licence_years
        @gender = gender
        @age = age
        @current_var = ""
        @points = 0
    end

    

    def evaluate_policy(policy)
        self.instance_eval(File.read(policy))
        result = @points.round(2)
        puts result
        return result
    end

    #def print_person()
        #puts "#{@brand},#{@postal_code},#{@licence_years},#{@gender},#{@age}"
    #end

    def range(*args)
        if args[0] === @licence_years && @current_var == "licence_years"
            @points += args[1]
            return
        elsif args[0] === @age && @current_var == "age"
            @points += args[1]
            return
        end
    end

    def code(*args)
        if args[0] == @postal_code
            @points += args[1]
        end
    end

    def rule(*args)
        if args.length() == 3
            if args[0] == @brand && args[1] == @postal_code.to_s[0..1].to_i
                @points *= args[2]
            end
        elsif args[0] > @licence_years
            args[1]
            @points *= args[1]
        end
    end


    def method_missing(name,*args)
        unless args.empty?
            if name.to_s == @brand || name.to_s == @gender
                @points += args[0]
                return
            end
        else
            @current_var = name.to_s
        end
    end
end

p = Person.new("Volvo","M", 2, 32, 58937)
p.evaluate_policy("policy.rb")
