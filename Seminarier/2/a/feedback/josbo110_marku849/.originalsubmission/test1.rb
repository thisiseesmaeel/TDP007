require 'test/unit'
require './football.rb'
require './weather'

class TestUppgift1 < Test::Unit::TestCase
    def test_uppgift1a
        file = File.open("football.txt")
        file_data = file.read()
        file.close()
        assert_equal("Aston_Villa", leastGoaldifferance(file_data))
        file = File.open("football2.txt")
        file_data = file.read()
        file.close()
        assert_equal("Manchester_U", leastGoaldifferance(file_data))
        assert_equal("Arsenal\nLiverpool\nNewcastle\nManchester_U\nLeeds\n", gdTable(file_data))
    end

    def test_uppgift1b
        file = File.open("weather.txt")
        file_data = file.read()
        file.close()
        assert_equal("Least difference: 14", lowestTempDifferance(file_data))

    end
end
