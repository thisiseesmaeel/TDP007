#1A
#Ladda in filen
def getDataF(file)
    File.open file do |file|
        filestring = file.read
        stats = filestring.scan(/([a-zA-Z_]+).*(\d.\s.-\s.\d.)/)
        return stats
      end
end

#Sorterar filens data enligt det regex mönstret vi vill använda
def getArrayF(array)
  sortArray = Array.new()
  for item in array do
    name = item[0]
    pointA = item[1].match(/^\d.\s*-\s*(\d.)/)[1]
    pointF = item[1].match(/^\d./)
    sortArray.append([name, (pointF.to_s.to_i - pointA.to_s.to_i).abs])
  end
  return sortArray
end

#Returnerar det laget med minst målskillnad
def minDifferenceF(array)
  minArray = getArrayF(array)
  i = 0
  numbers = Array.new()
  while i < minArray.size 
    numbers.append(minArray[i][1])
    if(minArray[i][1] == numbers.min)
      name = minArray[i][0]
    end
    i += 1
  end
  return "#{name} #{numbers.min}"
end

#Returnerar en lista av lag sorterad efter målskillnad, lägst målskillnad längst upp.
def diffRankingF(array)
  sortArray = getArrayF(array)
  #Returnen sorterar arrayen utifrån lägsta målskillnad.
  return sortArray.sort_by{|team| team[1]}
end

def mainF
  fileList = Array.new()
  fileList = getDataF("./football.txt")
  puts "Minimum Goal Difference: #{minDifferenceF(fileList)}"
  puts
  puts "Ranking:"
  for i in diffRankingF(fileList)
    print "#{i[0]} - #{i[1]} "
    puts
  end
end

mainF

#1B
def getDataW(file)
  File.open file do |file|
      filestring = file.read
      stats = filestring.scan(/^\s*(\d+)\s*(\d+)\*?\s{3,4}(\d+)/)
      return stats
    end
end

def getArrayW(array)
  sortArray = Array.new()
  for item in array do
    name = item[0]
    pointMXT = item[1]
    pointMNT = item[2]
    sortArray.append([name, (pointMXT.to_s.to_i - pointMNT.to_s.to_i).abs])
  end
return sortArray
end

def minDifferenceW(array)
minArray = getArrayW(array)
i = 0
numbers = Array.new()
while i < minArray.size 
  numbers.append(minArray[i][1])
  if(minArray[i][1] == numbers.min)
    day = minArray[i][0]
  end
  i += 1
end
return "#{day} - #{numbers.min}"
end

def diffRankingW(array)
sortArray = getArrayW(array)
#Returnen sorterar arrayen utifrån lägst skillnad i högsta och lägsta temperatur.
return sortArray.sort_by{|day| day[1]}
end

def mainW
fileList = Array.new()
fileList = getDataW("./weather.txt")
puts "Minimum Temperature Difference: Day #{minDifferenceW(fileList)} degrees"
puts
puts "Ranking:"
for i in diffRankingW(fileList)
  print "Day #{i[0]} - #{i[1]} degrees "
  puts
end
end
