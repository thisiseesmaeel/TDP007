# coding: utf-8
# ["apelsin", "banan", "citron"].inject { |f, s| f.length > s.length ? f : s }

def longest_string(block)
  block = Array
  longest.sort_by!(&:length).reverse! 
  #sort by the length and start with the longest one
  longest[0] #return the first item of the array (with 0 index)
end
longest_string(["apelsin", "banan", "citron"])
