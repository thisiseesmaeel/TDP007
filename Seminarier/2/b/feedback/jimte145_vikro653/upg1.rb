require 'rexml/streamlistener'
require 'rexml/document'

class MyListener
    include REXML::StreamListener
  
    attr_accessor :status, :result
  
    def initialize
      @status,@result = 0,[]
    end
  
    def tag_start(name, attrs)
      if name=="pre" then
        @status=1
      elsif name=="/pre" and @status==1 then
        @status=0
      end
    end
  
    def text(text)
      if @status==1 
            text.each_line do |line|
                @result.push(line) if !line.match(/Team|--|^\n$|MMU|Dy/)
            end
        end
    end
end

file = "football.txt"
@lst = MyListener.new
src = File.new(file)
REXML::Document.parse_stream(src,@lst)

def least_diff(i1,i2)
    sorted_lst = @lst.result.sort_by { |team| (team.split[i1].to_i - team.split[i2].to_i).abs}
    sorted_lst[0]
end

def table_sort(i1,i2)
    (@lst.result.sort_by { |team| (team.split[i1].to_i - team.split[i2].to_i).abs}).join
end

puts least_diff(1,20)
puts 
puts table_sort(6,8)
puts

file = "weather.txt"
@lst = MyListener.new
src = File.new(file)
REXML::Document.parse_stream(src,@lst)

puts least_diff(1,2)
puts 
puts table_sort(1,2)
