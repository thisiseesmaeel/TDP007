require './av1.2.rb'
require 'test/unit'

class Tester < Test::Unit::TestCase

    def test_uppgift1
        fileList = Array.new()
        fileList = getDataF("./football.txt")
        assert_equal([["Arsenal", "79  -  36"], ["Liverpool", "67  -  30"], 
            ["Manchester_U", "87  -  45"], ["Newcastle", "74  -  52"], ["Leeds", "53  -  37"], 
            ["Chelsea", "66  -  38"], ["West_Ham", "48  -  57"], ["Aston_Villa", "46  -  47"], 
            ["Tottenham", "49  -  53"], ["Blackburn", "55  -  51"], ["Southampton", "46  -  54"], 
            ["Middlesbrough", "35  -  47"], ["Fulham", "36  -  44"], ["Charlton", "38  -  49"], 
            ["Everton", "45  -  57"], ["Bolton", "44  -  62"], ["Sunderland", "29  -  51"], 
            ["Ipswich", "41  -  64"], ["Derby", "33  -  63"], ["Leicester", "30  -  64"]], fileList)
        assert_equal("Aston_Villa 1", minDifferenceF(fileList))
        assert_not_equal("Tottenham 5", minDifferenceF(fileList))
        assert_equal([["Aston_Villa", 1], ["Tottenham", 4], ["Blackburn", 4], ["Southampton", 8], 
            ["Fulham", 8], ["West_Ham", 9], ["Charlton", 11], ["Middlesbrough", 12], ["Everton", 12], 
            ["Leeds", 16], ["Bolton", 18], ["Newcastle", 22], ["Sunderland", 22], ["Ipswich", 23], 
            ["Chelsea", 28], ["Derby", 30], ["Leicester", 34], ["Liverpool", 37], ["Manchester_U", 42], 
            ["Arsenal", 43]] ,diffRankingF(fileList))
    end

    def test_uppgift2
        fileList = Array.new()
        fileList = getDataW("./weather.txt")
        assert_equal([["1", "88", "59"], ["2", "79", "63"], ["3", "77", "55"], ["4", "77", "59"], 
            ["5", "90", "66"], ["6", "81", "61"], ["7", "73", "57"], ["8", "75", "54"], 
            ["9", "86", "32"], ["10", "84", "64"], ["11", "91", "59"], ["12", "88", "73"], 
            ["13", "70", "59"], ["14", "61", "59"], ["15", "64", "55"], 
            ["16", "79", "59"], ["17", "81", "57"], ["18", "82", "52"], ["19", "81", "61"], 
            ["20", "84", "57"], ["21", "86", "59"], ["22", "90", "64"], ["23", "90", "68"], 
            ["24", "90", "77"], ["25", "90", "72"], ["26", "97", "64"], ["27", "91", "72"], 
            ["28", "84", "68"], ["29", "88", "66"], ["30", "90", "45"]], fileList)
        assert_equal("14 - 2", minDifferenceW(fileList))
        assert_not_equal("2 - 10", minDifferenceW(fileList))
        assert_equal([["14", 2], ["15", 9], ["13", 11], ["24", 13], ["12", 15], 
            ["2", 16], ["7", 16], ["28", 16], ["4", 18], ["25", 18], ["27", 19], 
            ["6", 20], ["10", 20], ["16", 20], ["19", 20], ["8", 21], ["3", 22], 
            ["23", 22], ["29", 22], ["5", 24], ["17", 24], ["22", 26], ["20", 27], 
            ["21", 27], ["1", 29], ["18", 30], ["11", 32], ["26", 33], ["30", 45], 
            ["9", 54]] ,diffRankingW(fileList))
    end

end