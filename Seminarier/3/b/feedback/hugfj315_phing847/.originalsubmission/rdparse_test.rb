require 'test/unit'
require './rdparse.rb'

class TestParse < Test::Unit::TestCase
    def test_uppgift2
      test_lang = My_lang.new()
      puts "Sätt valfri variabel till 100"
      assert_equal(test_lang.logex, "100")
    
      puts "Använd or med två falska uttryck. (or false false)"
      assert_equal(test_lang.logex, false)

      puts "Använd or med minst ett sant uttryck. (or true false)"
      assert_equal(test_lang.logex, true)
      
      puts "stack test. (and (or true false) (not false))"
      assert_equal(test_lang.logex, true)

      puts "stack test. (or (and true false) (not true))"
      assert_equal(test_lang.logex, false)
    end
end