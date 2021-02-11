require './upg2'
require 'test/unit'

class TestUpg2 < Test::Unit::TestCase
  def test_events
    test_hash = xhtml_read("events.html")[0]
    assert_equal("The Dark Carnival - 101.9FM", test_hash.event_hash["Name"])
    assert_equal("http://www.cfrc.ca", test_hash.event_hash["Website"])
    test_hash = xhtml_read("events.html")[2]
    assert_equal("silvermoon82", test_hash.event_hash["Posted by"])
    assert_equal("Kingston, Ontario", test_hash.event_hash["Location"])
    test_hash = xhtml_read("events.html")[3]
    assert_equal("The Bohemian, 248 Front Street, Belleville, Ontario", test_hash.event_hash["Location"])
    assert_equal("2008-01-13", test_hash.event_hash["Date"])
    assert_equal("Gothic, Industrial, Dark Alternative w/ DJ LunaSlave", test_hash.event_hash["Description"])
    assert_equal(8, xhtml_read("events.html").length)
  end
end

TestUpg2.new(1)
