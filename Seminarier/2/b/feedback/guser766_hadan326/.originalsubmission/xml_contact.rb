#!/bin/env ruby
require 'rexml/document'

def make_vevent_array
  doc = REXML::Document.new( File.open( "events2.txt" ) )
  vevent_arr = Array.new
  doc.elements.each( "//div[@class='vevent']" ) { |elem| vevent_arr.push( Vevent.new(elem) ) }
  vevent_arr
end

class Vevent
  attr_accessor :name, :locality, :region, :description, :when

  def initialize(vevent_obj)
    vevent_obj.each_element( ".//span[@class='summary']" ) { |elem| @name = elem.text }
    vevent_obj.each_element( ".//span[@class='locality']" ) { |elem| @locality = elem.text }
    vevent_obj.each_element( ".//span[@class='region']" ) { |elem| @region = elem.text }
    vevent_obj.each_element( ".//td[@class='description']" ) { |elem| @description = elem.elements }
    vevent_obj.each_element( ".//span[@class='dtstart']" ) { |elem| @when = elem.text }
  end

  def make_description
    s = ""
    for paragraph in @description do
      s += paragraph.text + "\n"
    end
    s
  end

  def to_string
    @name + "\n" + @when + "\n" + make_description + "\n" + @locality + ", " + @region
  end
end


def main
  vevent_arr = make_vevent_array
  vevent_arr.each { |vevent| puts( vevent.to_string + "\n\n\n" ) }
end

main
