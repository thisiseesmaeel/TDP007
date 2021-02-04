#Avsnitt 1: Iteratorer
#Uppgift 4
def find_it(array, &block)
	wanted = array[0]
	array.each do | e |
		if (yield(e, wanted))
			wanted = e
		end
	end
	puts "\"" + wanted + "\""
	return wanted
end

#find_it(["apelsin", "banan", "citron"]) { |a,b| a.length > b.length }
#find_it(["apelsin", "banan", "citron"]) { |a,b| a.length < b.length }
