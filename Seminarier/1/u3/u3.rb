def longest_string(longest)
  #sort by the length and start with the short one
  longest.sort_by!(&:length) 
  longest[-1] #return the last item of the array
end
p longest_string(["apelsin", "banan", "citron"])
