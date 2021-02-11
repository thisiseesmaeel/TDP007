class Person 

  def initialize(car, postal_code, card_year, sex, age)
    @car = car
    @postal_code = postal_code
    @card_year = card_year
    @sex = sex
    @age = age
    @points = 0
  end
  
  def evaluate_policy(filename)
    instance_eval(File.read(filename))
    if @sex == "M" && @card_year < 3 then
      @points *= 0.9
    end
    if @car == "Volvo" && @postal_code[0...2] == "58" then
      @points *= 1.2
    end
    return @points
  end

  def method_missing(name, *args)
    #puts "#{name}, #{args}"
    if eval("@#{name}") == args[0]
      @points += args[1]
    end
    if args[0].class == Range 
      if args[0].include? eval("@#{name}")
        @points += args[1]
      end
    end
  end
  
end

#Kalle = Person.new("Volvo", "58435", 2, "M", 32)
#puts Kalle.evaluate_policy("policy.rb")
