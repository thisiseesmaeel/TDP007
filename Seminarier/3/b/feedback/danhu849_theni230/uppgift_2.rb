load 'rdparse.rb'

class Logic

    def initialize
      @logicParser = Parser.new("logic") do
        token(/\s+/)
        token(/[a-zA-Z]+/) {|m| m }
        token(/[()]/) {|m| m }
        
        c = Hash.new 

        start :VALID do
         match(:ASSIGN) 
         match(:EXPR)
        end
      
        rule :ASSIGN do
          match('(', 'set', :VAR, :EXPR, ')') {|_, _,a, b, _| c = {a => b}}
          match(:EXPR)
        end

        rule :EXPR do
          match('(', 'or', :EXPR, :EXPR, ')') {|_, _,a, b, _| a || b}
          match('(', 'and', :EXPR, :EXPR, ')') {|_, _,a, b, _| a && b}
          match('(', 'not', :EXPR, ')') {|_, _,a, _| not a}
          match(:TERM)
        end
  
        rule :TERM do
          match('true') {true}
          match('false') {false}
          match(:VAR) {|a| c[a]}
        end

        rule :VAR do
          match(/[a-zA-Z]+/)
        end
        
      end
    end
    
    def done(str)
      ["quit","exit","bye",""].include?(str.chomp)
    end
    
    def logic(input = "")
      if(input.empty?)
        print "[Logic] "
        str = gets
        if done(str) then
          puts "Bye."
        else
          puts "=> #{@logicParser.parse str}"
          logic
        end
      else
        @logicParser.parse input

      end
    end
  
    def log(state = true)
      if state
        @logicParser.logger.level = Logger::DEBUG
      else
        @logicParser.logger.level = Logger::WARN
      end
    end
  end



