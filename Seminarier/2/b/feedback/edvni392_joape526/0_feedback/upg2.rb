# coding: utf-8
require "rexml/document"

class Event # Creates Event Object (hash)
  attr_reader :event_hash #getter
  def initialize()
    @event_hash = Hash.new
  end

  def add_field(key, value)
    @event_hash[key] = value
  end
  
  def to_s
    str = ""
    @event_hash.each do |key, value|
      str += "#{key}: #{value}\n"
    end
    return str
  end
end

def xhtml_read(website)
  src = File.open website
  doc = REXML::Document.new src
  event_list = Array.new
  doc.elements.each("//div[@class='vevent']") do |element| # Loops through all paths following div class named 'vevent'
    event = Event.new # Event object
    event.add_field("Name", element.elements[".//span[@class='summary']"].text)
    event.add_field("Date", element.elements[".//span[@class='dtstart']"].text)
    location = ""
    element.elements.each(".//td[@class='location']//")  do |l| # Finds all location data and combines it to a string
      if (l.has_text?) && (l.text.gsub(/\n/,'').strip != "")
        location += "#{l.text}, "
      end
    end
    event.add_field("Location", location[0...-2]) #städar upp location och lägger till i event object
    
    event.add_field("Description", element.elements[".//td[@class='description']/p"].text)
    event.add_field("Posted by", element.elements[".//a[@class='userLink ']"].text)
    
    #website
    website_element = element.elements[".//td/a[@target='_NEW']"]
    if website_element
      event.add_field("Website", website_element.text)
    end
    
    event_list << event
  end
  
 return event_list
end

def print_events(event_list) # Skriver ut varje event ur listan
  for e in (0...event_list.size)
  puts "Event #{e + 1}\n#{"="*8}\n#{event_list[e]}\n"
end

end

#print_events(xhtml_read("events.html"))
