require 'test/unit'
require './uppgift_2.rb'

class Tests_Upg2 < Test::Unit::TestCase
    def test_ASSIGN
        #Programmet hanterar inte siffror. Variablen kan endast innehålla booleans
        assert_equal(Logic.new.logic("(set test true)"), {"test"=>true})
        assert_equal(Logic.new.logic("(set true true)"), {"true"=>true})
        assert_equal(Logic.new.logic("(set ASDFGHJKL true)"), {"ASDFGHJKL"=>true})
        assert_equal(Logic.new.logic("(set test false)"), {"test"=>false})        
	end

    def test_EXPR
        assert_equal(Logic.new.logic("(or true true)"), true)
        assert_equal(Logic.new.logic("(or true false)"), true)
        assert_equal(Logic.new.logic("(or false true)"), true)
        assert_equal(Logic.new.logic("(or false false)"), false)

        assert_equal(Logic.new.logic("(and true true)"), true)
        assert_equal(Logic.new.logic("(and false true)"), false)
        assert_equal(Logic.new.logic("(and true false)"), false)
        assert_equal(Logic.new.logic("(and false false)"), false)

        assert_equal(Logic.new.logic("(not true)"), false)
        assert_equal(Logic.new.logic("(not false)"), true)
    end
    
    def test_TERM
        #Om du skriver något annat än true eller false utan paranteser så krashar programmet
        assert_equal(Logic.new.logic("true"), true)
        assert_equal(Logic.new.logic("false"), false)

        #För att testa att man kan skriva ut ett värde på en variabel man har skapat
        #så måste man skapa en instans som kommer att komma ihåg den skapade variabeln.
        test_logic = Logic.new

        test_logic.logic("(set test true)")
        assert_equal(test_logic.logic("test"), true)

        test_logic.logic("(set test false)")
        assert_equal(test_logic.logic("test"), false)

        test_logic.logic("(set ADASDASDASDASDASDASDASDASDASDASQRFASFAVDFD false)")
        assert_equal(test_logic.logic("ADASDASDASDASDASDASDASDASDASDASQRFASFAVDFD"), false)
    end
end