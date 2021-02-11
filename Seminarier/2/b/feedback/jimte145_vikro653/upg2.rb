# coding: utf-8
require 'rexml/streamlistener'
require 'rexml/document'

class Calandar

    include REXML::StreamListener

    attr_accessor :date_and_events, :doc, :cal_events

    def initialize(doc)
        @date_and_events,@cal_events,@doc = [],[],doc
        update_events
    end

    def update_events
        
        root = "//table/tr/td"
        @doc.elements.each(root) { |n| 
        date_string = ""
        valid_date = false

        # Hämtar och sparar datum i en sträng (1,2,3...)
        (n.elements.each("./span") { |s| 
            if s.text.to_s.match("^[0-9]{1,2}$")
                date_string += s.text.to_s + " : "
                valid_date = true
            end
        })

        # Om datumet har ett event sparas det för respektive datum (läggs på samma sträng)
        # Här sparas även alla event i en separat behållare, om man endast vill se events
        (n.elements.each("./a") { |s| 
            if valid_date
                date_string += s.text.to_s
                @cal_events.push(s.text)
            end
        })
        # Sträng med datum och eventuellt event läggs i behållaren @date_and_events
        @date_and_events.push(date_string) if valid_date
    }
    end

    def get_all_events        
        @cal_events
    end

    def get_calandar
        @date_and_events
    end 

    def get_event_on_day(day)
      if day > 31        
        "Invalid date"

      elsif @date_and_events[day - 1].match("^[0-9]{1,2}\s:\s$")       
        "no events on day " + day.to_s
        
      else        
        @date_and_events[day - 1]
      end
    end
end

file = "events.html"
src = File.new(file)
doc = REXML::Document.new src
lst = Calandar.new(doc)
REXML::Document.parse_stream(src,lst)

=begin
puts lst.get_all_events
puts
puts lst.get_calandar
puts
puts lst.get_event_on_day(25)
=end
