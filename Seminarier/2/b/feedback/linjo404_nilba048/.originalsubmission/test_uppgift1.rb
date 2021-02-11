require 'test/unit'
require './Uppgift1.rb'


class TestUppgift1a < Test::Unit::TestCase
    def test_uppgift1a
        file = File.open("football.txt")
        file_data = file.read()
        file.close()
        assert_equal("Aston_Villa", least_goal_diff(file_data))
        file = File.open("football_1.txt")
        file_data = file.read()
        file.close()
        assert_equal("Manchester_U", least_goal_diff(file_data))
        assert_equal("Arsenal\nLiverpool\nNewcastle\nManchester_U\nLeeds\n", goal_diff_table(file_data))
    end

end

class TestUppgift1b < Test::Unit::TestCase
    def test_uppgift1b
        file = File.open("weather.txt")
        file_data = file.read()
        file.close()
        assert_equal("14", lowest_temp_diff(file_data))
        assert_equal("14,15,13,24,12,2,7,28,4,25,27,6,10,16,19,8,3,23,29,5,17,22,20,21,1,18,11,30,9,", diff_list_table(file_data))
    end



end

