# coding: utf-8
#To install Nokogiri enter "sudo gem install nokogiri" in CLI, if you can't be bothered comment out the requires and load_url code and use load_file
require 'nokogiri'
require 'open-uri'

class Text_parser
    #attr_reader for testing purposes
    attr_reader :table_array, :text
    def initialize()
        @football_header = "Team             P   W   L   D   F    A  Pts"
        @football_print = proc {|sub_array| puts "%-15s %3s %3s %3s %3s %3s - %2s %3s" % sub_array[0..7]}
        @football_regex = /.*\. (\w+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+-\s+(\d+)\s+(\d+)/
        @football_compare = proc {|sub_array1, sub_array2| (sub_array1[5].to_i - sub_array1[6].to_i).abs <=> (sub_array2[5].to_i - sub_array2[6].to_i).abs}

        @weather_header = "  Dy  MxT    MnT    AvT    HDDay   AvDP  1HrP  TPcpn  WxType  PDir  AvSp  Dir  MxS  SkyC  MxR MnR   AvSLP"
        @weather_print = proc {|sub_array| puts "%4s %4s %6s %6s %8s %6s %5s %6s  %-6s %5s %5s %4s %4s %5s %4s %3s %7s" % sub_array[0..17]}
        @weather_regex =  /\s+(\d+)\s+(\d+)\**\s+(\d+)\**\s+(\d+)\s{0,8}(\d*)\s+(\d+\.\d+)\s{0,4}(\d*)\s+(\d+\.\d+)\s+(\w*)\s+(\d+)\s+(\d+\.\d+)\s+(\d+)\s+(\d+)\**\s+(\d+\.\d+)\s+(\d+)\s+(\d+)\s+(\d+\.\d+)/
        @weather_compare = proc {|sub_array1, sub_array2| (sub_array1[1].to_i - sub_array1[2].to_i).abs <=> (sub_array2[1].to_i - sub_array2[2].to_i).abs}
    end

    def load_url(url_string)
        @text = Nokogiri::HTML(URI.open(url_string)).xpath("//pre")[0].content
        create_array
    end

    def load_file(path)
        @text = File.new(path).read
        create_array
    end

    def print_table
        print(@table_array)
    end

    def print_top
        @table_array.first.length < 9 ? (puts @football_header; @football_print.call(@table_array.first)) : (puts @weather_header; @weather_print.call(@table_array.first))
    end
    #everything made public for testing purposes
    #private

    def create_array
        @text.include?("Team") ? (@table_array = @text.scan(@football_regex); sort_array(@football_compare)) : (@table_array = @text.scan(@weather_regex); sort_array(@weather_compare))
    end

    def sort_array(compare_proc)
        @table_array.sort! &compare_proc
    end

    def print(array)
        array[0].length < 9 ? (puts @football_header; array.each &@football_print) : (puts @weather_header; array.each &@weather_print)
    end
end

#tp = Text_parser.new
#tp.load_url('https://www.ida.liu.se/~TDP007/current/material/seminarie2/football.txt')
#tp.load_url('https://www.ida.liu.se/~TDP007/current/material/seminarie2/weather.txt')
#tp.load_file('./football.txt')
#tp.load_file('./weather.txt')
#tp.print_top
#tp.print_table

require 'rexml/document'

class XML_parser
    #attr_reader for testing purposes
    attr_reader :event_array
    def initialize()
        @event_array = []
    end
   
    def load_url(url_string)
        doc = REXML::Document.new(URI.open(url_string))
        events = doc.get_elements("//div[@class='vevent']")

        events.each {|event| 
            event_dictionary = {}
            event_dictionary["Name"] = event.elements[".//span[@class='summary']"].text
            event_dictionary["When"] = event.elements[".//span[@class='dtstart']"].text
            if !event.elements[".//div[@class='vcard']"].nil?
                event_dictionary["Org fn"] = event.elements[".//td[@class='location']//strong[@class='org fn']"].text
                event_dictionary["Street Address"] = event.elements[".//td[@class='location']//span[@class='street-address']"].text
            end
            event_dictionary["Locality"] = event.elements[".//td[@class='location']//span[@class='locality']"].text
            event_dictionary["Region"] = event.elements[".//td[@class='location']//span[@class='region']"].text
            event_dictionary["Description"] = event.elements[".//td[@class='description']/p"].text
            @event_array.push event_dictionary
            }
    end

    def print_events
        @event_array.each {|element| 
            element.each{|key, value|
                puts "#{key}: #{value}"
            }
            puts ""
        }
    end
end


xp = XML_parser.new
xp.load_url('https://www.ida.liu.se/~TDP007/current/material/seminarie2/events.html')
xp.print_events



# MARCUS VER

=begin
require 'rexml/document'
require 'open-uri'
class XML_PARSER
    #attr_reader :doc, :events

    def initialize
        @dict = Hash.new
        @data = []
    end

    def load_url(url)
        #doc = REXML::Document.new(open("https://www.ida.liu.se/~TDP007/current/material/seminarie2/events.html").read))
        @doc = REXML::Document.new(URI.open(url))
        
        @doc.elements.each("//div[@class='vevent']") do |element|
            #LÄGG TILL . FÖR ATT SÖKA RELATIVT TILL NUVARANDE NOD.
            @dict["Date"] = element.elements[".//span[@class='dtstart']"].text
            @dict["Summary"] = element.elements[".//span[@class='summary']"].text
            if element.elements[".//*[@class='street-address']"] != nil
                @dict["Street-Address"] = element.elements[".//*[@class='street-address']"].text
            else 
                @dict["Street-Address"] = ""
            end
            @dict["Locality"] = element.elements[".//*[@class='locality']"].text
            @dict["Region"] = element.elements[".//*[@class='region']"].text
            if element.elements[".//*[@class='org fn']"] != nil
                @dict["Org"] = element.elements[".//*[@class='org fn']"].text
            else
                @dict["Org"] = ""
            end

            @data.push @dict.clone
            @dict.clear
        end

        @data.each do |element|
            element.each do |key, value|
                puts key.to_s + ": " +  value.to_s
            end
            puts " "
        end
    end
end

xp = XML_PARSER.new
xp.load_url("https://www.ida.liu.se/~TDP007/current/material/seminarie2/events.html")
=end
