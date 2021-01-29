# coding: utf-8
require 'rexml/document'

#Event klass
class Event 

  attr_reader :date, :event, :location, :description,
              :adress, :region, :org_fn

    def initialize(date, event, location, description, adress, region, org_fn)
        @date = date
        @event = event
        @location = location
        @description = description
        @adress = adress
        @region = region
        @org_fn = org_fn
    end

    def to_s()
      "Datum: #{@date} \nEvent: #{@event} \nLocation: #{@location}\
      \nDescription: #{@description} \nAddress: #{@address} \nRegion: #{@region}\n\n"
    end
end

#Läser in fil
def read_xml(filename)
  src = File.open(filename)
  doc = REXML::Document.new(src)
end

#Hittar event
def find_event(data)
  new_doc = []
  data.elements.each("//div[@class='vevent']/*") { |n| new_doc << n }
  new_doc
end

#Skriver ut alla event
def output_events(event_array)
  puts event_array
end


def create_event(event_array)

  array_of_event_objects = []

  event_array.each do |event|
    summary = event.elements[".//span[@class='summary']/"].text()
    date = event.elements[".//span[@class='dtstart']/"].text()
    location = event.elements[".//span[@class='locality']/"].text()
    description = event.elements[".//td[@class='description']/p/"].text()
    region = event.elements[".//span[@class='region']/"].text()
    if event.elements[".//span[@class='street-address']/"]
      address = event.elements[".//span[@class='street-address']/"].text()
    else 
      address = "TBD"
    end

    if event.elements[".//strong[@class='org fn']/"]
      org_fn = event.elements[".//strong[@class='org fn']/"].text()
    else
      org_fn = "TBD"
    end

    array_of_event_objects << Event.new(date, summary, location, 
                                        description, address, region, org_fn)

  end

  return array_of_event_objects
    
end

# doc = read_xml("calender.xml")
# doc = find_event(doc)
# doc = create_event(doc)
# output_events(doc)
