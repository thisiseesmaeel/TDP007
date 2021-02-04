
#UPPGIFT 2
#Vi börjar med 1 för att om vi inte gör det så börjar "r" som värdet 0 och kan aldrig bli högre genom enbart multiplikation
def factorial(n)
    return (1..n).inject(1) { | result, number | result *= number}
end

#UPPGIFT 3
def longest_string(array)
    return array.max_by{ | x | x.length() }
    #Vi försökte med return max men det fungerade inte i ett av testfallen, där arrayen var:
    #["three", "five", "eleven", "sixteen"]
end

    
