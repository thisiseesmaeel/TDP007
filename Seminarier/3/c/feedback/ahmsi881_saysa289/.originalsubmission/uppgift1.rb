class Person
    attr_reader :points
    def initialize(brand, gender, licenseYears, age, postalCode)
        @brand = brand
        @gender = gender
        @licenseYears = licenseYears
        @age = age
        @postalCode = postalCode
        @points = 0
        self.instance_eval(File.read("policy.rb"))
    end

    def years(*args)
        if args[0] === @licenseYears 
            @points += args[1]
        end 
    end

    def span(*args)
        if args[0] === @age
            @points += args[1]
        end 
    end
    
    def pc(*args)
        if args[0] == @postalCode
            @points += args[1]
        end
    end

    def rule(*args)
        if @licenseYears < args[0].to_i && @gender == args[1]
            @points *= args[2]
        end
        if @brand == args[0] && @postalCode.to_s[0..1].to_i == args[1]
            @points *= args[2]
        end
    end

    def method_missing(name,*args)
        unless args.empty?
            if @brand == name.to_s || @gender == name.to_s
                @points += args[0]
            end
        end    
    end
end

p = Person.new("Volvo","M", 2, 32, 58435)
puts p.points

