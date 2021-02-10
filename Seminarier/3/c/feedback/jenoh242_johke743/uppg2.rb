# coding: utf-8
require './rdparse.rb'

class LogicalExpr

  def initialize

    @logicalExprParser = Parser.new("Logical expression ") do
      @vars = Hash.new

      token(/\s+/)
      token(/(true|false)/) {|m| m}
      token(/(and|or|not|set)/) {|m| m}
      token(/\A[a-zA-Z]+/) {|m| m}
      token(/./) {|m| m }

      start :valid do
        match(:assign)
        match(:expr)
      end

      rule :assign do
        match('(', 'set', :var, :expr, ')') do | _, _, a, b, _, | 
          @vars[a] = b
        end
      end

      rule :expr do

        match('(', 'or', :expr, :expr, ')') do | _, _, a, b, _, | 
          in_hash?(a) or in_hash?(b) 
        end

        match('(', 'and', :expr, :expr, ')') do | _, _, a, b, _, | 
          in_hash?(a) and in_hash?(b) 
        end

        match('(', 'not', :expr, ')') do | _, _, a, _, |
          if @vars.has_key?(a)
            @vars[a] = !@vars[a]
          else
            !a
          end
        end
        match(:term)
      end

      rule :term do
        match('true') {true}
        match('false') {false}
        match(:var)
      end

      rule :var do
        match(/\A[a-zA-Z]+/)

      end

      def in_hash?(var)
        if @vars.has_key?(var) then return @vars[var] else return var end
      end

    end
  end


  def done(str)
    ["quit","exit","bye",""].include?(str.chomp)
  end


  def run(str="", test=false)
    print "[Logical expression] "
    if str.empty?
      str = gets
    end

    if done(str) then
      puts "Bye."
    elsif test
      return @logicalExprParser.parse(str)
    else
      puts "=> #{@logicalExprParser.parse str}"
      run
    end
  end


  def log(state = true)
    if state
      @logicalExprParser.logger.level = Logger::DEBUG
    else
      @logicalExprParser.logger.level = Logger::WARN
    end
  end

end


# test = LogicalExpr.new
# test.run
