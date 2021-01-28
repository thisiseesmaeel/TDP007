require "./u2"
require "test/unit"

class Seminarium_2_2 < Test::Unit::TestCase
  def test_u2
    events_list = find_all_info()
    assert_equal("The Dark Carnival - 101.9FM", events_list[0].event_name)
    assert_equal("2008-01-04 10:00pm EST", events_list[0].event_date)
    assert_equal("Sinister Sundays", events_list[-1].event_name)
    assert_equal("2008-01-27", events_list[-1].event_date)
    assert_not_equal("Sinister Sundays", events_list[4].event_date)
  end
end
