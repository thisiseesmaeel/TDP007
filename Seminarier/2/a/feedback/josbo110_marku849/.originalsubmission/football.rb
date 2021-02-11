file = File.open("football.txt")
    file_data = file.read()
    file.close()

def leastGoaldifferance(tableOfTeams)
    teamName = /[0-9]{1,2}.\s{1}([a-zA-Z_]+)/
    goalDifferance = /([0-9]{1,3})\s{2}-\s{1,2}([0-9]{1,3})/
    allTeams = tableOfTeams.scan(teamName)
    differanceList = tableOfTeams.scan(goalDifferance)
    diffArray = []

    differanceList.each do | value | diffArray << (value[0].to_i - value[1].to_i).abs()
    end
    leastDifferance = diffArray.each_with_index.min()
    print("The team with the least goal difference: \n")
    return allTeams[leastDifferance[1]][0]
end

def gdTable(tableOfTeams)
    teamName = /[0-9]{1,2}.\s{1}([a-zA-Z_]+)/
    goalDifferance = /([0-9]{1,3})\s{2}-\s{1,2}([0-9]{1,3})/
    allTeams = tableOfTeams.scan(teamName)
    differanceList = tableOfTeams.scan(goalDifferance)
    diffArray = []

    differanceList.each_with_index do | value, index | diffArray << [(value[0].to_i - value[1].to_i), index] 
    end
    diffArray = diffArray.sort_by {| diff | diff[0]}.reverse()
    
    result = ""
    diffArray.each do | element | result << "#{(allTeams[element[1]][0])}\n"
    end
    print("\nSorted list by goaldifference: \n",result)
    return result
end

puts leastGoaldifferance(file_data)

puts gdTable(file_data)