file = File.open("weather.txt")
file_data = file.read()
file.close()

def lowestTempDifferance(tempTable)
    findPattern = /^\s*(\d{1,2})\s+(\d{1,3})\s+(\d{1,3})/
    stats = tempTable.scan(findPattern)
    listOfDifferances = []

    stats.each do | e | listOfDifferances << [e[0], e[1].to_i() - e[2].to_i()]
    end

    minimalDifferance = listOfDifferances.min_by {| e | e[1]}

    return "Least difference: " << minimalDifferance[0]
    end

    def listOfDifferances_table(tempTable)
    findPattern = /^\s*(\d{1,2})\s+(\d{1,3})\s+(\d{1,3})/
    stats = tempTable.scan(findPattern)
    listOfDifferances = []

    stats.each do | e | listOfDifferances << [e[0], e[1].to_i() - e[2].to_i()]
    end

    differanceArray = listOfDifferances.min_by(listOfDifferances.length()) {| e | e[1]}

    result = ""
    differanceArray.each do | element | result << "#{element[0]} "
    end
    print("Sorted by daily temperature: " , result)

return result
end

puts lowestTempDifferance(file_data)
puts listOfDifferances_table(file_data)