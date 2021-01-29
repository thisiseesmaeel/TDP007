require 'rexml/document'

def openFile(file)
    file = REXML::Document.new(File.open(file))
    return file
end

def getData(file)
    eventInfo = Array.new()
    #Appenda varje "vevent"-tag till eventInfo arrayen.file
    file.elements.each( "//div[@class='vevent']" ) { |vevent| eventInfo.append(vevent) }
    return eventInfo 
end

def cleanData(eventInfo)
    cleanData = Array.new()
    #Leta igenom varje "vevent"-tag efter den infon vi vill åt och appenda till arrayen cleanData
    for vevent in eventInfo do
        vevent.each_element(".//span[@class='summary']") { |tag| cleanData.append(tag.text) }
        vevent.each_element(".//span[@class='dtstart']") { |tag| cleanData.append(tag.text) }
        vevent.each_element(".//span[@class='locality']") { |tag| cleanData.append(tag.text) }
        vevent.each_element(".//span[@class='region']") { |tag| cleanData.append(tag.text) }
        vevent.each_element(".//td[@class='description']") { |tag| cleanData.append(tag.elements[1].text) }
        #Om det finns flera element i description så kommer de inte synas med den här lösningen då bara ett index i td taggen kommer synas nu..
    end
    return cleanData
end

def printData(cleanArray)
    #Printa varje "vevent"-tags relevanta information. För varje 5e element som printas separeras eventen med ett pu
    counter = 0
    for event in cleanArray do
        counter += 1
        puts "#{event}"
        if counter == 5
            counter = 0
            puts
        end
    end
end

file_test = getData(openFile("events.html"))
cleanFile = cleanData(file_test)
printData(cleanFile)