require './upp2.rb'
require 'test/unit'

class Tester < Test::Unit::TestCase

    def test_uppgift1
       file = openFile("events.html")
       file_test = getData(file)
       assert_equal(8, file_test.size)
       assert_equal("Sinister Sundays", cleanData(file_test)[5])
       assert_equal("Ontario", cleanData(file_test)[8])
       assert_equal("The Dark Carnival - 101.9FM", cleanData(file_test)[10])
       assert_equal("Kingston", cleanData(file_test)[12])
       assert_equal(40, cleanData(file_test).size)
    end
end

## TESTERNA SER BRA UT, VI TROR ATT DE ÄR VETTIGA, DET VILL
## SÄGA ATT DE TESTADE ALLT SOM DET BEHÖVDES.