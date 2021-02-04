# Avsnitt 1
# upg2
((1..20).inject { |multi, n| multi * n })

def factorial(n)
    count = 1
    numb = 1
    n.times {
        numb *= count
        count += 1
    }
    return numb
end

#upg3
def longest_string(arr)
    longest = ""
    arr.each do |n|
        if n.length > longest.length
            longest = n 
        end
    end
    return longest
end

# Avsnitt 3
# upg7
class Integer
    def fib
        if self == 1 or self == 2
            return 1
        else
            return ((self-1).fib + (self-2).fib)
        end
    end
end

# upg9
class Array
    def rotate_left(n = 1)
        n.times {
            self.push(self[0])
            self.delete_at(0)
        }

    end
end



