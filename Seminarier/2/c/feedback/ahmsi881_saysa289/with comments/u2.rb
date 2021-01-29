require 'rexml/document'

class MyCalenderClass

  attr_accessor :event_name, :event_date

  def initialize()
    @event_name = false
    @event_date = false
  end
  
  def print_all_info()
    puts "New event: " + @event_name + ", on the date: " + @event_date + "."
    puts
  end
end


## FUNCTION FOR MATCHING THE WANTED ATTRIBUTES IN THE FILE.
def find_all_info
  doc = REXML::Document.new(File.open"events.html")
  events_list = Array.new
  
  doc.elements.each('//div[@class="vevent"]//span[@class="summary"]') do |name|
    events_list << MyCalenderClass.new() #'"<<" add to the end of this array
    events_list.last.event_name = name.text #"last" Returns the last element(s) of the array
  end
  
  count = 0
  doc.elements.each('//div[@class="vevent"]//span[@class="dtstart"]') do |date|
    events_list[count].event_date = date.text
    count += 1
  end
  
  events_list.length.times do |event|
    events_list[event].print_all_info
  end
  return events_list
end

find_all_info()
