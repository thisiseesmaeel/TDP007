#!/bin/env ruby
# coding: utf-8
require 'test/unit'
require './uppg1'
require './uppg2'

class TestOne < Test::Unit::TestCase
  
  def test_simple()

    #De korrekta färdigsorterade matriserna
    f_res = [{"Aston_Villa"=>-1},
             {"Tottenham"=>-4},
             {"Blackburn"=>4},
             {"Southampton"=>-8},
             {"Fulham"=>-8},
             {"West_Ham"=>-9},
             {"Charlton"=>-11},
             {"Middlesbrough"=>-12},
             {"Everton"=>-12},
             {"Leeds"=>16},
             {"Bolton"=>-18},
             {"Newcastle"=>22},
             {"Sunderland"=>-22},
             {"Ipswich"=>-23},
             {"Chelsea"=>28},
             {"Derby"=>-30},
             {"Leicester"=>-34},
             {"Liverpool"=>37},
             {"Manchester_U"=>42},
             {"Arsenal"=>43}
            ]

    w_res =  [{"14"=>2},
              {"15"=>9},
              {"13"=>11},
              {"24"=>13},
              {"12"=>15},
              {"2"=>16},
              {"7"=>16},
              {"28"=>16},
              {"4"=>18},
              {"25"=>18},
              {"27"=>19},
              {"6"=>20},
              {"10"=>20},
              {"16"=>20},
              {"19"=>20},
              {"8"=>21},
              {"3"=>22},
              {"23"=>22},
              {"29"=>22},
              {"5"=>24},
              {"17"=>24},
              {"22"=>26},
              {"20"=>27},
              {"21"=>27},
              {"1"=>29},
              {"18"=>30},
              {"11"=>32},
              {"30"=>45},
              {"9"=>54}
             ]

    #Bygger sträng att jämföra med utskrift
    result = ""

    result += "#{f_res[0].keys.first} har haft minst skillad mellan gjorda och insläppta mål. Skillanden är #{f_res[0][f_res[0].keys.join]}.\n\n"

    f_res.each{ |team| result +=  team.keys.join + "\n"}

    result += "\n\n"

    result += "Dag #{w_res[0].keys.first} hade den minsta tempraturskillnaden mellan varmast och kallast dag. Skillnaden är #{ w_res[0][w_res[0].keys.join]} grader.\n\n"

    w_res.each{ |day| result += "Dag " + day.keys.join + "\n"}

    #Test  - jämförelse
    assert_equal(result, main_u1()) 
    
  end
end

class TestTwo < Test::Unit::TestCase
  def test_simple()
    src = File.open("events.html")
    doc = REXML::Document.new src

    events = []
    doc.elements.each("//*/div[@class=\"vevent\"]") { |n| events.push(Event.new(n, "summary", "dtstart", "locality", "region", "org fn", "street-address","description")) }

    assert_equal(8, events.size())
    assert_equal("The Dark Carnival - 101.9FM", events[0].name)
    assert_equal("2008-01-04 10:00pm EST", events[0].date)
    assert_equal("Kingston", events[0].city)
    assert_equal("Ontario", events[0].region)
    assert_equal("", events[0].venue)
    assert_equal("", events[0].address)
    assert_equal("\"The Dark Carnival is two hours of spooky goodness. Every week, expect the best goth, industrial, and other dark music, as well as news and reviews from the wider world of goth culture. Embrace the darkness! Fridays, from 10 PM until the Witching Hour.\"",  events[0].description)

    assert_equal("Sinister Sundays", events[1].name)
    assert_equal("2008-01-06", events[1].date)
    assert_equal("Belleville", events[1].city)
    assert_equal("Ontario", events[1].region)
    assert_equal("The Bohemian", events[1].venue)
    assert_equal("248 Front Street", events[1].address)
    assert_equal("Gothic, Industrial, Dark Alternative w/ DJ LunaSlave",  events[1].description)

    events2 = []
    doc.elements.each("//*/div[@class=\"vevent\"]") { |n| events2.push(Event.new(n, "", "dtstart", "locality", "region", "org fn", "street-address","description")) }

    assert_equal("", events2[0].name)
    assert_equal("2008-01-04 10:00pm EST", events2[0].date)
    assert_equal("Kingston", events2[0].city)
    assert_equal("Ontario", events2[0].region)
    assert_equal("", events[0].venue)
    assert_equal("", events[0].address)
    assert_equal("\"The Dark Carnival is two hours of spooky goodness. Every week, expect the best goth, industrial, and other dark music, as well as news and reviews from the wider world of goth culture. Embrace the darkness! Fridays, from 10 PM until the Witching Hour.\"",  events2[0].description)
  end
end


