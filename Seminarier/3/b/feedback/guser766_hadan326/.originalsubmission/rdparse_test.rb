require './rdparse.rb'
require 'test/unit'

class TestUppgift < Test::Unit::TestCase
    def test_simple
   
        l = Language.new
        # Ger variabel ett värde
        result = l.languageParser.parse "(set var_1 true)"
        assert_equal(result, true)

        # Variabelns värde skrivs ut som "true"
        result = l.languageParser.parse "var_1"
        assert_equal(result, true)

        # En till variabel sätts
        result = l.languageParser.parse "(set var_2 false)"
        assert_equal(result, false)

        # En av variablerna är "true" vilket borde ge "true"
        result = l.languageParser.parse "(or var_2 var_1)"
        assert_equal(result, true)

        # Båda variabler är inte "true" vilket borde ge "false"
        result = l.languageParser.parse "(and var_2 var_1)"
        assert_equal(result, false)

        # Motsattsen till "false" ska bli "true"
        result = l.languageParser.parse "(not var_2)"
        assert_equal(result, true)

        # Ger variabeln var_2 värdet av var_1
        result = l.languageParser.parse "(set var_2 var_1)"
        assert_equal(result, true)

        # Värdet borde nu vara "true"
        result = l.languageParser.parse "var_2"
        assert_equal(result, true)
    end
  end
  