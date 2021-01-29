require "test/unit"
require "./uppg1.rb"

class TestTeam < Test::Unit::TestCase
    def test_team
        team1 = Component.new("Arsenal", 10, 20)
        assert_equal("Arsenal", team1.name)
        assert_equal(10, team1.value_1)
        assert_equal(20, team1.value_2)
        assert_equal(10, team1.diff)
    end

    def test_create_teams
      test_string = ["Team    P     W    L   D    F      A     Pts",
                     "1. Arsenal         38    26   9   3    79  -  36    87",
                     "2. Liverpool       38    24   8   6    67  -  30    80", 
                     "1111111111111111111111111",
                     "2222222222222222222222222",
                     "100. faslkdjfklsadfjlksdajf"]

      filtered = create_teams(test_string)
      
      assert_equal("Arsenal", filtered[0].name)
      assert_equal("Liverpool", filtered[-1].name)
    end

    def test_sort_array
      team1 = Component.new("A1", 1, 2)
      team2 = Component.new("A2", 1, 3)
      team3 = Component.new("A3", 1, 5)
      team4 = Component.new("A4", 1, 4)

      team_array = []
      team_array << team1 << team2 << team3 << team4

      sorted_teams = sort_by_diff(team_array)
      assert_equal(1, sorted_teams[0].diff)
      assert_equal("A3", sorted_teams[-1].name)
      assert_equal("A4", sorted_teams[2].name)
      assert_equal("A1", sorted_teams[0].name)
    end


    def test_get_lowest_diff
      team1 = Component.new("A1", 1, 2)
      team2 = Component.new("A2", 1, 3)
      team3 = Component.new("A3", 1, 5)
      team4 = Component.new("A4", 1, 4)

      team_array = []
      team_array << team1 << team2 << team3 << team4

      sorted_teams = sort_by_diff(team_array)
      assert_equal(1, sorted_teams[0].diff)
      assert_equal("A3", sorted_teams[-1].name)
      assert_equal("A4", sorted_teams[2].name)
      assert_equal("A1", sorted_teams[0].name)

      lowest = get_lowest_diff(sorted_teams)
      assert_equal(1, lowest.diff)
      assert_equal("A1", lowest.name)
    end


    def test_read_file
      content = read_file("test.txt")
      assert_equal(["Hej\n"], content)
    end

    def test_program
      array_of_teams = []
      file_data = read_file("football.txt")
      array_of_teams = create_teams(file_data)

      array_of_teams = sort_by_diff(array_of_teams)
      assert_equal(1, array_of_teams[0].diff)
      #assert_equal()
    end

    
end
