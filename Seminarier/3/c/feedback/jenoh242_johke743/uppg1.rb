#!/bin/env ruby
# encoding: utf-8


class Person

  attr_accessor :car, :postal, :exp_years, :sex, :age, :sum

    def initialize(car, postal, exp_years, sex, age)
        @car = car
        @postal = postal
        @exp_years = exp_years
        @sex = sex
        @age = age
        @sum = 0
    end

    def car(brand, points)
        if @car == brand
            @sum += points
        end
    end

    def postal(code, points)
        if @postal == code
            @sum += points
        end
    end

    def years(interval, points)
        re = /(\d+)-(\d+)/
        low = re.match(interval)[1].to_i
        high = re.match(interval)[2].to_i
        if @exp_years >= low && @exp_years <= high
            @sum += points
        end
    end

    def sex(gender, points)
        if @sex == gender
            @sum += points
        end
    end

    def age(interval, points)
        re = /(\d+)-(\d+)/
        low = re.match(interval)[1].to_i
        high = re.match(interval)[2].to_i
        if @age >= low && @age <= high
            @sum += points
        end
    end

    def apply_rules()
        if @sex == "M" && @exp_years < 3
            @sum *= 0.9
        end
        if @postal.to_s[0..1].to_i == 58 && @car == "Volvo"
            @sum *= 1.2
        end
    end


    def evaluate_policy(filename)
        instance_eval(File.read(filename))
        apply_rules()
        return @sum
    end

end
        

# kalle = Person.new("Volvo", 58435, 2, "M", 32)
# puts kalle.evaluate_policy("policy.rb")

