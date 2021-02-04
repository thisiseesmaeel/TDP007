require "./s1"
require "test/unit"


class Test_1 < Test::Unit::TestCase

    def test_ntimes
		i = 0
		n_times(3) { i += 1 }
		assert_equal(3, i)
    
        test_repeat = Repeat.new(3)
        n = 2
        test_repeat.each { n += 1 }
        assert_equal(n, 5)
    
    end

end

class Test_2 < Test::Unit::TestCase
    def test_fact
        assert_equal(fact(5), 120)
        assert_equal(fact(20), 2432902008176640000)
    end

end

class Test_3 < Test::Unit::TestCase

    def test_longest_string
        assert_equal(longest_string(["apelsin", "banan", "citron"]), "apelsin")
        assert_equal(longest_string(["apelsin", "bananbanan", "citron"]), "bananbanan")
        assert_equal(longest_string(["apelsin", "banan", "citronhello"]), "citronhello")

    end
end


class Test_5_6 < Test::Unit::TestCase
    
    def test_initialize
        s = PersonName.new()
        assert_equal(" ", s.fullname)

        s.fullname = "duck ducky"
        assert_equal("ducky duck", s.fullname)
    end

    def test_fullname
        person1 = PersonName.new("ducky duck")
        assert_equal("duck ducky", person1.fullname)

        person1.fullname = "am raman"
        assert_equal("raman am", person1.fullname)
    end

    def test_name

        person1 = Person.new("duck", "ducky", 55)
        assert_equal("ducky duck", person1.name)

    end

    def test_age
        person1 = Person.new("duck", "ducky", 55)
        assert_equal(55, person1.age)

        person1.age = 22
        assert_equal(22, person1.age)
    end

    def test_birthyear
        person1 = Person.new("duck", "ducky", 55)
        assert_equal(1966, person1.birthyear)

        person1.age = 22
        assert_equal(1999, person1.birthyear)

    end
end


 class Test_8_9 < Test::Unit::TestCase

    def test_acronym
        assert_equal("LOL", "Laugh out loud".acronym)
        assert_equal("DWIM", "Do what I mean!!".acronym)
        assert_equal("BOB", "Black orbiting baloon".acronym)
        assert_not_equal("BOB", "Beep beep beep".acronym)

    end

    def test_rotate_left
    assert_equal([2, 3, 1], [1,2,3].rotate_left)
    assert_equal([1, 2, 3], [1,2,3].rotate_left(3))
    assert_equal([3, 1, 2], [1,2,3].rotate_left(-1))
    end
end


class Test_10 < Test::Unit::TestCase
    def test_find_user
    assert_equal("Brian", find_user("HELLOHELLOHELLO HELLO USERNAME: Brian"))
    assert_equal("Beep", find_user("DSAD 34234 2 //sd* /USERNAME: Beep"))
    end
end

class Test_11 < Test::Unit::TestCase
    def test_tag
        url = "<head> <title> </title> </script> <style> </style> </head> <nobr> </b> </a> <u> </u> </nobr> </div> </span> <center> <br> </td> </tr> </table> </form> </p> </center> </body> </html>"
        assert_equal(["<head>", "<title>", "</title>", "</script>", "<style>", "</style>", "</head>", "<nobr>", "</b>", "</a>", "<u>", "</u>", "</nobr>", "</div>", "</span>", "<center>", "<br>", "</td>", "</tr>", "</table>", "</form>", "</p>", "</center>", "</body>", "</html>"], tagNames(url))
    end
end

class Test_12 < Test::Unit::TestCase

    def test_upg12
    assert_equal( "FMA297", regnr("Min bil heter FMA297.") )
    assert_equal( false, regnr("XQT784"))
    assert_equal( false, regnr("bil bil III353"))

    end
end