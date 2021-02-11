require 'rexml/document'

src = File.open("events.html")
file = REXML::Document.new(src)
src.close

def get_events(doc)
    content = {
        "Event": ".//*[@class='summary']",
        "Date": ".//*[@class='dtstart']",
        "Location": ".//*[@class='locality']",
        "Description": ".//*[@class='description']//*",
    }
    
    event_dic = {}
    content.each do |name,info| 
        if doc.elements[info] and doc.elements[info].text
            event_dic[name] = doc.elements[info].text
        end
    end
    return event_dic
end

events = []
file.elements.each("//div[@class='vevent']") do |doc|
    events.push(get_events(doc))
end

def print(events)
    events.each do |prt|
        prt.each do |key,value|
            puts "#{key}: #{value}"
        end
        puts ""
    end
end

 print(events)
