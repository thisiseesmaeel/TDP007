require "./rdparse.rb"

class Logic
    
    def initialize
      @logParser = Parser.new("logic roller") do
        @vars = {}
        token(/\s+/)
        token(/\d+/) {|m| m.to_i }
        token(/[a-zA-Z]+/) {|m| m}
        token(/./) {|m| m }
        
        start :valid do
            match(:assign)
            match(:expr)
        end

        rule :assign do
            match('(','set', :var, :expr , ')') {|_,_,a,b,_| @vars[a] = b}
        end

        rule :expr do 
          match('(', 'or', :expr, :expr, ')') {|_,_,a, b,_| a || b }
          match('(','and', :expr, :expr , ')') {|_,_,a, b,_| a && b }
          match('(','not', :expr , ')') {|_,_,a,_| !a}
          match(:term)
        end
        
        rule :term do 
          match('true') {|a| a = true}
          match('false') {|a| a = false}
          match(:var){| a | @vars[a]}
        end
        
        rule :var do
          #var can be an integer or a string
          match(Integer)
          match(String)
        end
      end
    end
    
    def done(str)
      ["quit","exit","bye",""].include?(str.chomp)
    end
    
    #Function for normal program use
    def roll
      print "[logic] "
      str = gets
      if done(str) then
        puts "Bye."
      else
        puts "=> #{@logParser.parse str}"
        roll
      end
    end

    #Function for testing
    def roll_test(str)
      print "[logic] "
      #str = gets
      if done(str) then
        puts "Bye."
      else
        return @logParser.parse str
      end
    end

    ## I roll_test funktion så skulle det fungera om gruppen hade
    ## bara skrivit rad 66 i den.

    #Uncomment for Debugger

    def log(state = true)
      if state
         @logParser.logger.level = Logger::DEBUG
      else
         @logParser.logger.level = Logger::WARN
      end
    end
end

#Logic.new.roll

## Testerna är vettiga och funkar som de ska fast det är två tester
## som inte funkar av någon anledning som vi inte kunde hitta 
## problemet.