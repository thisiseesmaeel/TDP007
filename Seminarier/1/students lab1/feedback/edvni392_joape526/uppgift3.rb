
def longest_string(list)
    longest = list[0].length
    word_to_return = list[0]

    list.each do | item | 
        if item.length > longest 
            longest = item.length
            word_to_return = item
        end
    end

    word_to_return
end
