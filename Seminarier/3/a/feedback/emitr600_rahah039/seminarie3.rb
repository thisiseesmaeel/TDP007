# Uppgift 1

class Person
    attr_accessor :policy_cost, :sum

    def initialize(car_brand, zip_code, experience, gender, age)
        @policy_cost = {}
        @car_brand = car_brand
        @zip_code = zip_code
        @experience = experience # years of driving experience
        @gender = gender
        @age = age
        @sum = 0
        
    end

    def evaluate_policy(file_name)
        instance_eval(File.read(file_name))
        modifier
    end

    # Applicerar specialreglerna som gäller för vissa personer. 
    def modifier
        @policy_cost.values.map{|x| @sum += x}    

        if @gender== "M" && @experience < 3
            @sum *= 0.9
        end

        if @car_brand == "Volvo" && @zip_code.to_s[0..1] == "58"
            @sum *= 1.2
        end
    end

    # Funktionerna som kallas används som check för att kolla datatypen.
    # För datatyper (t.ex. age) som består av ett intervall där användaren kan angett ett värde som är mindre än det listat i policy.rb gör vi en koll där om en nyckel inte har sparats defaultas den till noll.
    def method_missing(name, *args)
        if name.to_s == "brand" && args[0] == @car_brand
            @policy_cost[:brand] = args[1]
        end
        
        if name.to_s == "zip"
            if @zip_code >= args[0]
                @policy_cost[:zip] = args[1]
            elsif !@policy_cost.key?(:zip)
                @policy_cost[:zip] = 0
            end
        end

        if name.to_s == "gender" && @gender == args[0]
            @policy_cost[:gender] = args[1]
        end

        if name.to_s == "experience" 
            if @experience >= args[0]
                @policy_cost[:experience] = args[1]
            elsif !@policy_cost.key?(:experience)
                @policy_cost[:experience] = 0
            end
        end

        if name.to_s == "age" 
            if @age >= args[0]
                @policy_cost[:age] = args[1]
                puts "Age: #{@age}"
            elsif !@policy_cost.key?(:age)
                @policy_cost[:age] = 0
                puts "Age: #{@age}"
            end
        end
    end

    def display
        puts @policy_cost
        puts @sum
    end

end

#kalle = Person.new("Volvo", 48515, -1, "M", 17)
#kalle.evaluate_policy("policy.rb")
#kalle.display

# Uppgift 2

require './rdparse'
class Dsl

    def initialize
      @DslParser = Parser.new("Dsl") do
        @variables = {}
        token(/\s+/)
        token(/\(/) {|m| m }
        token(/\)/) {|m| m }
        token(/[a-zA-Z]+/) {|m| m }
        token(/\d+/) {|m| m.to_i }
  
        start :valid do
          match(:assign)
          match(:expr)
        end
  
        rule :assign do 
          match('(', 'set', :key, :expr, ')') {|_,_,key,expr,_| @variables[key] = expr}
        end
  
        rule :expr do 
          match('(', 'or', :expr, :expr, ')') {|_, _, expr1, expr2, _| expr1 || expr2  }
          match('(', 'and', :expr, :expr, ')') {|_, _, expr1, expr2, _| expr1 && expr2 }
          match('(', 'not', :expr, ')') {|_, _, expr1, _| !expr1 }
          match('(', :term, ')') {|_,term,_| term}
          match(:term)
        end
  
        rule :term do 
            match("false") { false }
            match("true") { true }
            match(:var)   
        end

        rule :key do
            match(String)
        end
  
        rule :var do 
            match(:var) {|a| @variables[a]}
            match(Integer)
            match(String)
        end
  
      end
    end
  
    def log(state = true)
      if state
        @DslParser.logger.level = Logger::DEBUG
      else
        @DslParser.logger.level = Logger::WARN
      end
    end
  
    def done(str)
      ["quit","exit","bye",""].include?(str.chomp)
    end
  
    # Interaktiv parser
    def evaluate_expr
      print "[DSL PARSER] "
      str = gets
      if done(str) then
        puts "Bye."
      else
        puts "=> #{@DslParser.parse str}"
        evaluate_expr
      end
    end
  
    # Parser som används för testfallen
    def eval_test(str)
      @DslParser.parse str
    end
  
  end
  
  #test = Dsl.new
  #test.evaluate_expr
  #test.eval_test("(set banan 5)")
  #test.eval_test("(set 5 banan)")
  
  #puts test.eval_test("5")
  