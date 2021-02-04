require './av1.rb'
require './av2.rb'
require './av3.rb'
require './av4.rb'
require 'test/unit'
class Tester < Test::Unit::TestCase

    def testAv1
        n_times(50) {puts "HELLO"}
        do_three = Repeat.new(100)
        do_three.each { puts "Hooray!" }
   
        assert_equal(93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000, factorial(100))
        assert_equal(1, factorial(0))
        assert_equal(1, factorial(1))
        assert_equal(120, factorial(5))
        assert_equal(2432902008176640000, factorial(20))
    end

    def testAv2
        person = PersonName.new()
        person.setter("Michael Lake grdgdr")
        assert_equal("Michael Lake", person.getter())

        personName = PersonName.new()
        personName.setter("Zac kariassssssssssssssssssssssssss sssssssssssssssssssssssssssssss
            sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss Ouacha")
        person = Person.new(personName, 100000000)
    end

    def testAv3
        assert_equal("HJHSEGGGGGGGGGGGGGGG6", "Hej jag heter Svejgesgse egs ges ges ges gfes ges ges ges ges ges ges ges ges ges GGGGGGggg ges2215t6546437 6436346".acronym)
        newArray = [1,2,3]
        newArray.rotate_left(1000)
    end

    def testAv4
        assert_equal("micHAEL",findUserName("Usernamees ger egs ge ges gesqwa""""6464e64e6e46e46: micHAEL"))
        tagNames("https://www.amazon.se/")
    end
end