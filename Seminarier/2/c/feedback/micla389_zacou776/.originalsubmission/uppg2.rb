require 'rexml/document'

class Event
  attr_reader :name, :date, :city, :region, :venue, :address, :description
  def initialize(src, name="", date="", city="", region="", venue="", address="", description="")
    doc = REXML::Document.new src.to_s()
    @name = find_text(doc, name)
    @date = find_text(doc, date)
    @city = find_text(doc, city)
    @region = find_text(doc, region)
    @venue = find_text(doc, venue)
    @address = find_text(doc, address)
    @description = find_text(doc, description)
  end
  
  def find_text(doc, attribute)
    content = doc.elements.to_a("//*[@class=\"#{attribute}\"]")
    if content[0] == nil
      return ""
    end
    if content[0].texts().join("").strip() == ""
      content = doc.elements.to_a("//*[@class=\"#{attribute}\"]/*")
    end
    return content[0].texts().join(" ")
  end

  def print()
    puts("Name: #{name}")
    puts("Time: #{date}")
    puts("Place: #{city}, #{region}")
    puts("Venue: #{venue}")
    puts("Address: #{address}")
    puts("Description: #{description}")
    puts("")
  end
end

src = File.open("events.html")

doc = REXML::Document.new src
events = []

doc.elements.each("//*/div[@class=\"vevent\"]") { |n| events.push(Event.new(n, "summary", "dtstart", "locality", "region", "org fn", "street-address","description")) }

events.each() { |n| n.print() }
