require 'rexml/document'
require 'open-uri'

class Calendar
  Event = Struct.new(:summary, :dtstart, :location, :description) do
    def to_s
      "name: #{summary}\n"\
      "date: #{dtstart}\n"\
      "location: #{location}\n"\
      "description: #{description}\n"
    end
  end
  
  def initialize dom
    @events = []
    dom.root.elements.each("//div[@class='vevent']") do | vevent |
      summary = vevent.elements[".//*[@class='summary']"].text
      dtstart = vevent.elements[".//*[@class='dtstart']"].text
      location = ""
      vevent.elements.each ".//*[@class='org fn'] | .//*[@class='street-address'] 
      | .//*[@class='locality'] | .//*[@class='region'] " do | tag | 
        location << tag.text + ", "
      end
      location.chop!.chop!
      description = vevent.elements[".//p"].text 
      @events << Event.new(summary, dtstart, location, description)
    end
  end

  def to_s
    out = ""
    @events.each do | event |
      out << event.to_s << "\n"
    end
    out.chop!
  end

  def [] index
    @events[index]
  end
end