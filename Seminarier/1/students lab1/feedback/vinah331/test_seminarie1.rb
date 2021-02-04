require'./seminarie1'
require'test/unit'
class TestSeminarie < Test::Unit::TestCase
    def test_upg1
        testresultat = ""
        n_times(3) {testresultat += "n_times"}
        assert_equal("n_timesn_timesn_times", testresultat)

        testresultat = ""
        do_three = Repeat.new(3)
        do_three.each {testresultat += "repeat"}
        assert_equal("repeatrepeatrepeat", testresultat)

        testresultat = ""
        do_three = Repeat.new()
        do_three.each { testresultat += "Tom sträng" }
        assert_equal("", testresultat)
    end

    def test_upg3
        assert_equal("apelsin", (longest_string ["apelsin","banan","citron"]))
        assert_equal("apelsin", (longest_string ["banan","apelsin","citron"]))
        assert_equal("banan", (longest_string ["banan","banan","banan"]))
        assert_equal("banan", (longest_string ["banan"]))
    end

    def test_upg5
        test = PersonName.new("simon", "ahrenstedt")
        assert_equal("simon ahrenstedt", (test.fullname))

        test.fullname = "marcus lidekrans"
        assert_equal("marcus lidekrans", (test.fullname))
    end

    def test_upg6
        test = Person.new("Simon", "Ahrenstedt", 30)

        assert_equal(30, (test.age))
        assert_equal("Simon Ahrenstedt", (test.name.fullname))
        assert_equal(1991, (test.birthyear))

        test.age = 15
        assert_equal(15, (test.age))
        assert_equal(2006, (test.birthyear))

        test.birthyear = 1992
        assert_equal(29, (test.age))
        assert_equal(1992, (test.birthyear))

        test2 = Person.new
        assert_equal(20, (test2.age))
        assert_equal("John Doe", (test2.name.fullname))
        assert_equal(2001, (test2.birthyear))
    end

    def test_upg7
        assert_equal(0, (0.fib))
        assert_equal(1, (1.fib))
        assert_equal(1, (2.fib))
        assert_equal(2, (3.fib))
        assert_equal(3, (4.fib))
        assert_equal(5, (5.fib))
        assert_equal(8, (6.fib))
        assert_equal(13, (7.fib))
        assert_equal(21, (8.fib))
    end

    def test_upg8
        assert_equal("FBI", ("först banan interaktiv".acronym))
        assert_equal("BRB", ("Banan rumpa Bar".acronym))
        assert_equal("G2G", ("geologi 2 gröt".acronym))
    end

    def test_upg10
        assert_equal("banan", find_username("asdljh klj ASDlj USERNAME: banan lkjdsf ASljh"))
        assert_equal("banan", find_username("USERNAME: banan"))
        assert_equal("banan", find_username("USERNAME: banan ajhsdjkh"))
        assert_equal("banan", find_username("asdgeSDF USERNAME: banan"))
        assert_equal("h4ck3rm4n", find_username("USERNAME: h4ck3rm4n"))
    end

    def test_upg12
        assert_equal("ABC123", find_regnr("kjhasd123 sadfl98 ABC123 ABD246 lkjhdf"))
        assert_equal("DGF12A", find_regnr("kjhasd123 sadfl98 DGF12A ABC123 ABD246  lkjhdf"))
        assert_equal(false, find_regnr("kjhasd123 sadfl98  lkjhdf"))
    end
end