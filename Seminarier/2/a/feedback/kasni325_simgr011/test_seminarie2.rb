require'./seminarie2'
require'test/unit'
class TestSeminarie < Test::Unit::TestCase
    def test_upg1_load
        football_url_text = "\n       Team            P     W    L   D    F      A     Pts\n    1. Arsenal         38    26   9   3    79  -  36    87\n    2. Liverpool       38    24   8   6    67  -  30    80\n    3. Manchester_U    38    24   5   9    87  -  45    77\n    4. Newcastle       38    21   8   9    74  -  52    71\n    5. Leeds           38    18  12   8    53  -  37    66\n    6. Chelsea         38    17  13   8    66  -  38    64\n    7. West_Ham        38    15   8  15    48  -  57    53\n    8. Aston_Villa     38    12  14  12    46  -  47    50\n    9. Tottenham       38    14   8  16    49  -  53    50\n   10. Blackburn       38    12  10  16    55  -  51    46\n   11. Southampton     38    12   9  17    46  -  54    45\n   12. Middlesbrough   38    12   9  17    35  -  47    45\n   13. Fulham          38    10  14  14    36  -  44    44\n   14. Charlton        38    10  14  14    38  -  49    44\n   15. Everton         38    11  10  17    45  -  57    43\n   16. Bolton          38     9  13  16    44  -  62    40\n   17. Sunderland      38    10  10  18    29  -  51    40\n   -------------------------------------------------------\n   18. Ipswich         38     9   9  20    41  -  64    36\n   19. Derby           38     8   6  24    33  -  63    30\n   20. Leicester       38     5  13  20    30  -  64    28\n"
        weather_url_text = "\n MMU June 2002\n\n  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP\n\n   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5\n   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5\n   3  77    55    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8\n   4  77    59    68          51.1       0.00         110  9.1 130  12  8.6  62 40 1021.1\n   5  90    66    78          68.3       0.00 TFH     220  8.3 260  12  6.9  84 55 1014.4\n   6  81    61    71          63.7       0.00 RFH     030  6.2 030  13  9.7  93 60 1012.7\n   7  73    57    65          53.0       0.00 RF      050  9.5 050  17  5.3  90 48 1021.8\n   8  75    54    65          50.0       0.00 FH      160  4.2 150  10  2.6  93 41 1026.3\n   9  86    32*   59       6  61.5       0.00         240  7.6 220  12  6.0  78 46 1018.6\n  10  84    64    74          57.5       0.00 F       210  6.6 050   9  3.4  84 40 1019.0\n  11  91    59    75          66.3       0.00 H       250  7.1 230  12  2.5  93 45 1012.6\n  12  88    73    81          68.7       0.00 RTH     250  8.1 270  21  7.9  94 51 1007.0\n  13  70    59    65          55.0       0.00 H       150  3.0 150   8 10.0  83 59 1012.6\n  14  61    59    60       5  55.9       0.00 RF      060  6.7 080   9 10.0  93 87 1008.6\n  15  64    55    60       5  54.9       0.00 F       040  4.3 200   7  9.6  96 70 1006.1\n  16  79    59    69          56.7       0.00 F       250  7.6 240  21  7.8  87 44 1007.0\n  17  81    57    69          51.7       0.00 T       260  9.1 270  29* 5.2  90 34 1012.5\n  18  82    52    67          52.6       0.00         230  4.0 190  12  5.0  93 34 1021.3\n  19  81    61    71          58.9       0.00 H       250  5.2 230  12  5.3  87 44 1028.5\n  20  84    57    71          58.9       0.00 FH      150  6.3 160  13  3.6  90 43 1032.5\n  21  86    59    73          57.7       0.00 F       240  6.1 250  12  1.0  87 35 1030.7\n  22  90    64    77          61.1       0.00 H       250  6.4 230   9  0.2  78 38 1026.4\n  23  90    68    79          63.1       0.00 H       240  8.3 230  12  0.2  68 42 1021.3\n  24  90    77    84          67.5       0.00 H       350  8.5 010  14  6.9  74 48 1018.2\n  25  90    72    81          61.3       0.00         190  4.9 230   9  5.6  81 29 1019.6\n  26  97*   64    81          70.4       0.00 H       050  5.1 200  12  4.0 107 45 1014.9\n  27  91    72    82          69.7       0.00 RTH     250 12.1 230  17  7.1  90 47 1009.0\n  28  84    68    76          65.6       0.00 RTFH    280  7.6 340  16  7.0 100 51 1011.0\n  29  88    66    77          59.7       0.00         040  5.4 020   9  5.3  84 33 1020.6\n  30  90    45    68          63.6       0.00 H       240  6.0 220  17  4.8 200 41 1022.7\n  mo  82.9  60.5  71.7    16  58.8       0.00              6.9          5.3\n"
        football_txt = "Source <a\nhref=\"http://sunsite.tut.fi/rec/riku/soccer_data/tab/93_94/table.eng0.01_02.html\">sunsite.tut.fi/rec/riku/soccer_data/tab/93_94/table.eng0.01_02.html</a>\n\n<pre>\n       Team            P     W    L   D    F      A     Pts\n    1. Arsenal         38    26   9   3    79  -  36    87\n    2. Liverpool       38    24   8   6    67  -  30    80\n    3. Manchester_U    38    24   5   9    87  -  45    77\n    4. Newcastle       38    21   8   9    74  -  52    71\n    5. Leeds           38    18  12   8    53  -  37    66\n    6. Chelsea         38    17  13   8    66  -  38    64\n    7. West_Ham        38    15   8  15    48  -  57    53\n    8. Aston_Villa     38    12  14  12    46  -  47    50\n    9. Tottenham       38    14   8  16    49  -  53    50\n   10. Blackburn       38    12  10  16    55  -  51    46\n   11. Southampton     38    12   9  17    46  -  54    45\n   12. Middlesbrough   38    12   9  17    35  -  47    45\n   13. Fulham          38    10  14  14    36  -  44    44\n   14. Charlton        38    10  14  14    38  -  49    44\n   15. Everton         38    11  10  17    45  -  57    43\n   16. Bolton          38     9  13  16    44  -  62    40\n   17. Sunderland      38    10  10  18    29  -  51    40\n   -------------------------------------------------------\n   18. Ipswich         38     9   9  20    41  -  64    36\n   19. Derby           38     8   6  24    33  -  63    30\n   20. Leicester       38     5  13  20    30  -  64    28\n</pre>\n"
        weather_txt = "(Unofficial, Preliminary Data). Source: <a\nhref=\"http://www.erh.noaa.gov/er/box/dailystns.html\">www.erh.noaa.gov/er/box/dailystns.html</a>\n\n<pre>\n MMU June 2002\n\n  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP\n\n   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5\n   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5\n   3  77    55    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8\n   4  77    59    68          51.1       0.00         110  9.1 130  12  8.6  62 40 1021.1\n   5  90    66    78          68.3       0.00 TFH     220  8.3 260  12  6.9  84 55 1014.4\n   6  81    61    71          63.7       0.00 RFH     030  6.2 030  13  9.7  93 60 1012.7\n   7  73    57    65          53.0       0.00 RF      050  9.5 050  17  5.3  90 48 1021.8\n   8  75    54    65          50.0       0.00 FH      160  4.2 150  10  2.6  93 41 1026.3\n   9  86    32*   59       6  61.5       0.00         240  7.6 220  12  6.0  78 46 1018.6\n  10  84    64    74          57.5       0.00 F       210  6.6 050   9  3.4  84 40 1019.0\n  11  91    59    75          66.3       0.00 H       250  7.1 230  12  2.5  93 45 1012.6\n  12  88    73    81          68.7       0.00 RTH     250  8.1 270  21  7.9  94 51 1007.0\n  13  70    59    65          55.0       0.00 H       150  3.0 150   8 10.0  83 59 1012.6\n  14  61    59    60       5  55.9       0.00 RF      060  6.7 080   9 10.0  93 87 1008.6\n  15  64    55    60       5  54.9       0.00 F       040  4.3 200   7  9.6  96 70 1006.1\n  16  79    59    69          56.7       0.00 F       250  7.6 240  21  7.8  87 44 1007.0\n  17  81    57    69          51.7       0.00 T       260  9.1 270  29* 5.2  90 34 1012.5\n  18  82    52    67          52.6       0.00         230  4.0 190  12  5.0  93 34 1021.3\n  19  81    61    71          58.9       0.00 H       250  5.2 230  12  5.3  87 44 1028.5\n  20  84    57    71          58.9       0.00 FH      150  6.3 160  13  3.6  90 43 1032.5\n  21  86    59    73          57.7       0.00 F       240  6.1 250  12  1.0  87 35 1030.7\n  22  90    64    77          61.1       0.00 H       250  6.4 230   9  0.2  78 38 1026.4\n  23  90    68    79          63.1       0.00 H       240  8.3 230  12  0.2  68 42 1021.3\n  24  90    77    84          67.5       0.00 H       350  8.5 010  14  6.9  74 48 1018.2\n  25  90    72    81          61.3       0.00         190  4.9 230   9  5.6  81 29 1019.6\n  26  97*   64    81          70.4       0.00 H       050  5.1 200  12  4.0 107 45 1014.9\n  27  91    72    82          69.7       0.00 RTH     250 12.1 230  17  7.1  90 47 1009.0\n  28  84    68    76          65.6       0.00 RTFH    280  7.6 340  16  7.0 100 51 1011.0\n  29  88    66    77          59.7       0.00         040  5.4 020   9  5.3  84 33 1020.6\n  30  90    45    68          63.6       0.00 H       240  6.0 220  17  4.8 200 41 1022.7\n  mo  82.9  60.5  71.7    16  58.8       0.00              6.9          5.3\n</pre>\n\n"
        
        tp1 = Text_parser.new
        tp1.load_url('https://www.ida.liu.se/~TDP007/current/material/seminarie2/football.txt')
        assert_equal(football_url_text, tp1.text)

        tp2 = Text_parser.new
        tp2.load_url('https://www.ida.liu.se/~TDP007/current/material/seminarie2/weather.txt')
        assert_equal(weather_url_text, tp2.text)

        tp3 = Text_parser.new
        tp3.load_file('./football.txt')
        assert_equal(football_txt, tp3.text)

        tp4 = Text_parser.new
        tp4.load_file('./weather.txt')
        assert_equal(weather_txt, tp4.text)
    end

    def test_upg1_array_length
        tp1 = Text_parser.new
        tp1.load_url('https://www.ida.liu.se/~TDP007/current/material/seminarie2/football.txt')
        assert_equal(20,tp1.table_array.length)
        tp1.table_array.each{|sub_array| assert_equal(8,sub_array.length)}

        tp2 = Text_parser.new
        tp2.load_url('https://www.ida.liu.se/~TDP007/current/material/seminarie2/weather.txt')
        assert_equal(30,tp2.table_array.length)
        tp2.table_array.each{|sub_array| assert_equal(17,sub_array.length)}

        tp3 = Text_parser.new
        tp3.load_file('./football.txt')
        assert_equal(20,tp1.table_array.length)
        tp3.table_array.each{|sub_array| assert_equal(8,sub_array.length)}

        tp4 = Text_parser.new
        tp4.load_file('./weather.txt')
        assert_equal(30,tp2.table_array.length)
        tp4.table_array.each{|sub_array| assert_equal(17,sub_array.length)}
    end

    def test_upg1_sort
        tp1 = Text_parser.new
        tp1.load_url('https://www.ida.liu.se/~TDP007/current/material/seminarie2/football.txt')
        assert_equal(["Aston_Villa", "38", "12", "14", "12", "46", "47", "50"], tp1.table_array[0])
        assert_equal(["Arsenal", "38", "26", "9", "3", "79", "36", "87"], tp1.table_array[-1])
        
        tp2 = Text_parser.new
        tp2.load_url('https://www.ida.liu.se/~TDP007/current/material/seminarie2/weather.txt')
        assert_equal(["14", "61", "59", "60", "5", "55.9", "", "0.00", "RF", "060", "6.7", "080", "9", "10.0", "93", "87", "1008.6"], tp2.table_array[0])
        assert_equal(["9", "86", "32", "59", "6", "61.5", "", "0.00", "", "240", "7.6", "220", "12", "6.0", "78", "46", "1018.6"], tp2.table_array[-1])

        tp3 = Text_parser.new
        tp3.load_file('./football.txt')
        assert_equal(["Aston_Villa", "38", "12", "14", "12", "46", "47", "50"], tp3.table_array[0])
        assert_equal(["Arsenal", "38", "26", "9", "3", "79", "36", "87"], tp3.table_array[-1])
    
        tp4 = Text_parser.new
        tp4.load_file('./weather.txt')
        assert_equal(["14", "61", "59", "60", "5", "55.9", "", "0.00", "RF", "060", "6.7", "080", "9", "10.0", "93", "87", "1008.6"], tp4.table_array[0])
        assert_equal(["9", "86", "32", "59", "6", "61.5", "", "0.00", "", "240", "7.6", "220", "12", "6.0", "78", "46", "1018.6"], tp2.table_array[-1])


        tp5 = Text_parser.new
        tp5.load_file('./modified_football.txt')
        assert_equal(["Arsenal", "38", "26", "9", "3", "0", "0", "87"], tp5.table_array[0])
        assert_equal(["Manchester_U", "38", "24", "5", "9", "87", "45", "77"], tp5.table_array[-1])

    end

    def test_upg2
        xp = XML_parser.new
        xp.load_url('https://www.ida.liu.se/~TDP007/current/material/seminarie2/events.html')
        assert_equal({"Name"=>"The Dark Carnival - 101.9FM", "When"=>"2008-01-04 10:00pm EST", "Locality"=>"Kingston", "Region"=>"Ontario", "Description"=>"\"The Dark Carnival is two hours of spooky goodness. Every week, expect the best goth, industrial, and other dark music, as well as news and reviews from the wider world of goth culture. Embrace the darkness! Fridays, from 10 PM until the Witching Hour.\""}, xp.event_array[0])
        assert_equal({"Name"=>"Sinister Sundays", "When"=>"2008-01-06", "Org fn"=>"The Bohemian", "Street Address"=>"248 Front Street", "Locality"=>"Belleville", "Region"=>"Ontario", "Description"=>"Gothic, Industrial, Dark Alternative w/ DJ LunaSlave"}, xp.event_array[1])
        

        assert_equal(8, xp.event_array.length)
        assert_equal(5, xp.event_array[0].length)
        assert_equal(7, xp.event_array[1].length)


    end

end