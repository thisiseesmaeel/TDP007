require 'test/unit'
require './constraint-parser.rb'


class Tests_Upg1 < Test::Unit::TestCase

	def test_constraint_parser
    cp = ConstraintParser.new

    # test variables
    a,b,c = cp.parse "a+b=c"
    a.user_assign(1)
    b.user_assign(4)
    assert_equal(c.value, 1+4)


    # test addition
    a,b=cp.parse "a+1=b+2"
    a.user_assign(34)
    assert_equal(b.value, 34-1)

    a.forget_value "user"
    b.user_assign(34)
    assert_equal(a.value, 34+1)


    # test negation
    a,b = cp.parse "a-3=b"
    a.user_assign(34)
    assert_equal(b.value, 34-3)

    a,b = cp.parse "a=77-b"
    a.user_assign(34)
    assert_equal(b.value, 77-34)

    a,b,c,d = cp.parse "100 = a-b-c-d"
    a.user_assign(40)
    b.user_assign(20)
    c.user_assign(10)
    assert_equal(d.value, -(100 - 40 + 20 + 10))


    # test multiplication
    a,b = cp.parse "9*a=b"
    a.user_assign(34)
    assert_equal(b.value, 9*34)

    a,b = cp.parse "9*a=b*33"
    a.user_assign(34)
    assert_equal(b.value, 9*34/33)   


    # test  division
    a,b = cp.parse "a/b = 55"
    a.user_assign(164)
    assert_equal(b.value, 164/55)

    a,b = cp.parse "44 = 55/a/b"
    a.user_assign(11)
    assert_equal(b.value, 0)


    # test parentheses
    a,b = cp.parse "a=(b+0)"
    a.user_assign(7)
    assert_equal(b.value, 7)

    a,b = cp.parse "(a-55)*3=b"
    b.user_assign(15)
    assert_equal(a.value, 15/3 + 55)


    # test clesius <=> fahrenheit
    c,f=cp.parse "9*c=5*(f-32)"
    c.user_assign(100)
    assert_equal(f.value, (100*9)/5 + 32)

    f,c=cp.parse "5*(f-32)=9*c"
    c.user_assign(100)
    assert_equal(f.value, (100*9)/5 + 32)


    # test large equation
    a,b,c,d,e = cp.parse "(a*(b-34/c))*8+d/77=(e+12)/99"
    a.user_assign(12)
    b.user_assign(1)
    c.user_assign(-56)
    d.user_assign(0)
    assert_equal(e.value, ((12*(1-34/-56))*8+0/77)*99-12)


    # stuff that doesnt work
    a,b = cp.parse "a*a=b"
    b.user_assign(25)
    #assert_equal(a.value, 5)  -> a == false

    #a,b = cp.parse "a=b"  -> error

	end
end

