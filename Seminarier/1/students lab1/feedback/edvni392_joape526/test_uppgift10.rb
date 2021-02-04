require "test/unit"
require "./uppgift10.rb"

class TestFaculty < Test::Unit::TestCase
  def test_match 
    assert_equal(nil, parse_string("USERNAME: 123BrianVVV"))

    assert_equal("uSerNamE", parse_string("username: uSerNamE: BAbaBo rarara"))

    assert_equal("BAbaBo", parse_string("zzzzzUSERnamE: BAbaBo"))

    assert_equal(nil, parse_string("zzzzzUSERNAMEzzzz: BAbaBo"))

    assert_equal(nil, parse_string("USERNAME: 123124231"))

    #användarnamnet är större än 12 bokstäver
    assert_equal(nil, 
                 parse_string("USERNAME: XXXXXXXXXXXXXXXXX"))

    #användarnamnet har exakt än 3 bokstäver
    assert_equal("kek", parse_string("USERNAME: kek"))

    #användarnamnet har mindre än 3 bokstäver
    assert_equal(nil, parse_string("USERNAME: ke"))

    #användarnamnet har exakt 12 bokstäver
    assert_equal("qwertyuioPAS", parse_string("USERNAME: qwertyuioPAS"))

    assert_equal(nil, parse_string("blabla: 123124231 lalalallal 2222"))

  end
end
