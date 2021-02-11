require "test/unit"
require "./uppgift2"
require 'rexml/document'

class Test2 < Test::Unit::TestCase

    def test_events
        src = File.open("events.html")
        file = REXML::Document.new(src)
        events = []

        file.elements.each("//div[@class='vevent']") do |doc|
        events.push(get_events(doc))
        end

        assert_equal("The Dark Carnival - 101.9FM", events[0][:Event])
        assert_equal("2008-01-04 10:00pm EST", events[0][:Date])
        assert_equal("Kingston", events[0][:Location])

        assert_equal("Sinister Sundays", events[1][:Event])
        assert_equal("2008-01-06", events[1][:Date])
    end
end