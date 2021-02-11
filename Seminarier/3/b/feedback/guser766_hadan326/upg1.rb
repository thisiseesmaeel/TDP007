class Person

    def initialize(car, postnumber, d_amount_years, sex, age)
        @car = car
        @postnumber = "P_" + postnumber
        @d_amount_years = d_amount_years
        @sex = sex
        @age = age
        @points = 0
        @header_list = [@car, @postnumber, @d_amount_years, @sex, @age]
        
    end
  
    def evaluate_policy(file)
        self.instance_eval(File.read(file))

        # Specialfall 1
        if @d_amount_years < 3 && @sex == "M"
            @points *= 0.9
        else
            @points
        end

        # Specialfall 2
        if @car == "Volvo" && @postnumber[2..3] == "58"
            @points *= 1.2
        else
            @points
        end
        @points.round(2)
    end
    
    def method_missing(name,*args)

        # Körkort antal år
        if name[0].to_s == "Y"
            max_y = name.match(/to([0-9]{1,2})/)[1].to_i
            min_y = name.match(/Y_([0-9]{1,2})/)[1].to_i
            if @d_amount_years >= min_y && @d_amount_years <= max_y
                @points += args[0]
            end
        end
        if name[0].to_s == "A"
            max_y = name.match(/to([0-9]{1,2})/)[1].to_i
            min_y = name.match(/A_([0-9]{1,2})/)[1].to_i
            if @age >= min_y && @age <= max_y
                @points += args[0]
            end
        end

        # Allmän beräkning av poäng
        if @header_list.any? { |header| name.to_s == header }
            @points += args[0]
        end

    end
  
end