def n_times(num, &block)
    num.times {block.call()}
    
end

class Repeat
    def initialize(num)
        @times = num
    end

    def each(&block)
        n_times(@times, &block)
    end 
end

