class Person
    
    def initialize(car_model, post_number, license_year, sex, age)
        @car_model = car_model
        @post_number = post_number
        @license_year = license_year
        @sex = sex
        @age = age
        @result = 0
    end

    def evaluate_policy(filename)
        instance_eval(File.read(filename))
        return @result
    end

    def car_model(*car_models)
        car_models.each do |car_model|
            if car_model[0] == @car_model
                @result += car_model[1]
            end
        end
    end

    def post_number(*post_numbers)
        post_numbers.each do |post_number|
            if post_number[0] == @post_number
                @result += post_number[1]
            else 
                @result += 0
            end
        end
    end

    def license_year(*license_years)
        license_years.each do |license_year|
            if @license_year.between?(license_year[0], license_year[1])
                @result += license_year[2]
            end
        end
    end

    def sex(*sexes)
        sexes.each do |sex|
            if sex[0] == @sex
                @result += sex[1]
            end
        end
    end

    def age(*ages)
        ages.each do |age|
            if @age.between?(age[0], age[1])
                @result += age[2]
            end
        end
    end

    def special_rule(special_rule) 
       eval(special_rule)
    end

end

