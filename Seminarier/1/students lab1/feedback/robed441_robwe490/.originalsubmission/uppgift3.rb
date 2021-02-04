#Avsnitt 1: Iteratorer
#Uppgift 3
def longest_string(array)
	longest = ""
	array.each do | e | 
		if (longest.length < e.length)
			longest = e
		end
	end
	puts "\"" + longest + "\""
	return longest
end

longest_string ["apelsin", "banan", "citron"]
