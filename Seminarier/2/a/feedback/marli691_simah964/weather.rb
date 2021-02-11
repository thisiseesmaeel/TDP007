class Weather
  
  attr_reader :day, :diff
              
  def initialize(day, diff)
    @day = day
    @diff = diff
  end
end

def read_file_w(filename)
  arr = []
  f = File.open filename
  f.each do |line|
    l = line.split
    if /\d+/.match(l[0]) && /\d+/.match(l[1])
      arr.push(Weather.new(l[0], l[1].to_i - l[2].to_i))
    else
      next
    end
  end
  arr = arr.sort_by {|obj| obj.diff }
  return arr
end


def print_w(arr)
  mini = arr.min {|a,b| a.diff <=> b.diff}
  puts "The day with the smallest difference in temperature is:"
  puts "day " + mini.day
  puts
  puts "The days sorted by their difference in temperature:"
  puts "day".ljust(10) + "difference"
  arr.each do |obj|
    puts obj.day.ljust(10) + "#{obj.diff}"
  
  end
end



#print_w(read_file_w("weatherfile.txt"))
