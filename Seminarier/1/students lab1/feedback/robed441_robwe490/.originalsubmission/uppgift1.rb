#Avsnitt 1: Iteratorer
#Uppgift 1
def n_times(n)
	n.times do
		yield
	end
end

class Repeat
	def initialize(n)
		@n = n
	end
	
	def each
		@n.times do
			yield
		end
	end
end

#n_times(3) { puts "Hello!" }
#do_three = Repeat.new(3)
#do_three.each { puts "Hooray!" }
