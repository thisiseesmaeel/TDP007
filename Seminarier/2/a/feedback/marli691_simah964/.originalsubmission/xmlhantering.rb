# coding: utf-8 #!/usr/bin/ruby -w 
require 'rexml/document'
include REXML

class Event
  attr_accessor :summary, :dtstart, :locality, :region
  def initialize(summary,dtstart,locality,region)
    @summary = summary
    @dtstart = dtstart
    @locality = locality
    @region = region

  end
end


def parsing(filename)
  events = []
  file = File.open filename
  doc = REXML::Document.new(file)
  
  XPath.each(doc,"//div[@class='vevent']") do |div|
  summary = XPath.first(div,".//span[@class='summary']").text
  dtstart = XPath.first(div,".//span[@class='dtstart']").text
  locality = XPath.first(div,".//span[@class='locality']").text
  region = XPath.first(div,".//span[@class='region']").text
  events.push(Event.new(summary, dtstart, locality, region))
  end
  return events
end

def print_x(events)
  events.each do |event|
    puts "summary: #{event.summary}"
    puts "dtstart: #{event.dtstart}"
    puts "locality: #{event.locality}"
    puts "region: #{event.region}"
    puts
  end
end


#print_x(parsing("events.html"))
