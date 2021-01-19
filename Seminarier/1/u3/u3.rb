def longest_string(longest)
  longest.sort_by!(&:length) 
  longest[-1]
end
