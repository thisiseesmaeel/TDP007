# def n_times
#   yield
#   yield
#   yield
# end
# n_times { puts "Hello!" }

# def n_times(count, &block)
#   value = 1
#   1.upto(count) do | i |
#     value = value
#     block.call(value)
#   end
# end

# n_times(3) do | i, f_i | puts "#{f_i}" end

# class Repeater
#   def initialize(&block)
#     @block = block
#     @count = 0
#   end

#   def repeat
#     @count += 1
#     @block.call(@count)
#   end
# end

# repeater = Repeater.new do | count | 
#   puts "Horray!" 
# end
# 3.times do repeater.repeat end

# def n_times
#   n.times do
#     puts "Hello!"
#   end
# end

# n_times(3)

# def infinite_loop
#     while true
#         yield
#     end
# end

# infinite_loop do
#     puts "This message will appear infinite times"
# end

# class Integer
#     def run_times(n)
#         counter = 0
#         until counter == self
#             yield
#             counter += 1
#         end
#     end
# end

# run_times(3) do
#     puts "Hello!"
# end

def make_iter(upto)
  def iter(upto, block)
    (1 .. upto).each do |v|
      block.call(v)
    end
  end
  lambda { |block| iter(upto, block) }
end

def user(obj)
  obj.call Proc.new {  puts "Hello!" }
end

user(make_iter(3))
