#Named groups seems to only work for match, and you can only access the group
#members for each match with index, when using scan

# def teamlist(str)
#   re = /(?<name>[a-zA-z]+).+\s(?<F>\d+)\s+-\s+(?<A>\d+).+/
#   matches = str.scan(re)
#   for match in matches
#     puts "#{match[:name]} #{match[:F]} #{match[:]}"
#   end
# end

def data_fetcher(str, re) # Extraherar data ur en sträng med ett regexuttryck
  array = []
  #re = /(?<identifier>[a-zA-z]+).+\s(?<data1>\d+)\s+-\s+(?<data2>\d+).+/
  matches = str.scan(re)
  for match in matches
    array.append({identifier: match[0], data1: match[1].to_i, data2: match[2].to_i})
  end
  return array
end

def data_diff_sort(array)
  return array.sort_by {|data| (data[:data1] - data[:data2]).abs}
end

def least_diff(array)
  return array.min_by {|data| (data[:data1] - data[:data2]).abs}
end

def suffix_check(int) # Returnerar lämpligt suffix baserat på integer
  if int == "1"
    suffix = "st"
  elsif int == "2"
    suffix = "nd"
  elsif int == "3"
    suffix = "rd"
  else
    suffix = "th"
  end
  return suffix
end
if __FILE__ == $0
  #--Part 1----------------------------------------------------------------------
  #--Football
  str = File.new("football.txt").read
  re = /([a-zA-z]+).+\s(\d+)\s+-\s+(\d+).+/
  sorted = data_diff_sort(data_fetcher(str, re))
  counter = 1
  for team in sorted
    puts "#{counter}: #{team[:identifier]} F: #{team[:data1]} A: #{team[:data2]}"
    counter += 1
  end
  least_diff_team = least_diff(data_fetcher(str, re))
  puts "\nLeast diff: #{least_diff_team[:identifier]} #{least_diff_team[:data1]} #{least_diff_team[:data2]}\n\n"

  #--Part 2-------------------------------------------------------------------------------------
  #--Weather

  str = File.new("weather.txt").read
  re = /^\s+(\d{1,2})\s+(\d{1,2})\*?\s+(\d{1,2}).+\n/
  sorted = data_diff_sort(data_fetcher(str, re))
  puts sorted.collect {|day| "#{day[:identifier]}#{suffix_check(day[:identifier])} MxT: #{day[:data1]} MnT: #{day[:data2]}"}
  least_diff_temp = least_diff(data_fetcher(str, re))
  puts "\nLeast diff: #{least_diff_temp[:identifier]}#{suffix_check(least_diff_temp[:identifier])} MxT: #{least_diff_temp[:data1]} MnT: #{least_diff_temp[:data2]}"
end
