require './u10'
require 'test/unit'

class Testusername < Test::Unit::TestCase
  def test_username
    assert_not_equal("Brifn", username("Userdfme: Brian"))
    assert_equal("ismail", username("Username: ismail"))
    assert_not_equal("Ahmet", username("Userdfme: Ahmed"))
    assert_equal("Joel", username("Username: Joel"))
  end
end

