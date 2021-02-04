#Avsnitt 1: Iteratorer
#Uppgift 2
#(1..20).inject { |result, i| result *= i }

def factorial(n)
	return (1..n).inject { |result, i| result *= i }
end

#puts factorial(20)
