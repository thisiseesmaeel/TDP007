class Team
  attr_reader :name, :diff, :absdiff
  def initialize(name, diff)
    @name = name
    @diff = diff
    @absdiff = diff.abs
  end
end

def read_file(filename)
  arr = []
  f = File.open filename
  f.each do |line|
    l = line.split
    if /\d+\./.match(l[0]) && /[a-zA-Z]*/.match(l[1])
      arr.push(Team.new(l[1], l[6].to_i - l[8].to_i))
    else
      next
    end
  end
  f.close
  arr = arr.sort_by {|obj| obj.diff }
  arr = arr.reverse()
  return arr
end



def print_report(arr)
  mini = arr.min {|a,b| a.absdiff <=> b.absdiff}
  puts "The team with the smallest goal difference is:"
  puts mini.name
  puts
  puts "The teams sorted by their goal difference:"
  arr.each do |obj|
    puts obj.name.ljust(20) + "#{obj.diff}"
  end
end

#print_report(read_file("footballfile.txt"))
