require 'rexml/document'

def event_catcher(source)
    sum = "//div[@class='vevent']//span[@class='summary']"
    dat = "//div[@class='vevent']//span[@class='dtstart']"
    loc = "//div[@class='vevent']//span[@class='locality']"
    desc = "//div[@class='vevent']//td[@class='description']//p" 

    objects = []
    source.elements.each(sum) { objects.append Hash.new() }

    source.elements.each_with_index(sum) { |info, index| objects[index]["Event name"] = info.text}
    source.elements.each_with_index(dat) { |info, index| objects[index]["Date"] = info.text}
    source.elements.each_with_index(loc) { |info, index| objects[index]["Location"] = info.text}
    source.elements.each_with_index(desc) { |info, index| objects[index]["Description"] = info.text}

    return objects
end

def print_events(events)
    events.each do | event |
        event.each do |title, info|
            puts "#{title}: #{info}"
        end
        puts
    end
end