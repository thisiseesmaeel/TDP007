require_relative 'constraint_parser'
require 'test/unit'

class Testupg < Test::Unit::TestCase

  def test_test_cases
    cp=ConstraintParser.new
    c,f=cp.parse "9*c = 5*(f-32)"
    f.user_assign(0)
    assert_equal(c.value, -18)

    f.user_assign(100)
    assert_equal(c.value, 37)
  end

  def test_unsloved_cases
    cp=ConstraintParser.new
    c,f,g=cp.parse "c = 5*f+g"
    f.user_assign(10)

    assert_equal(c.value, false)
    assert_equal(g.value, false)
    assert_equal(f.value, 10)
  end

  def test_small_cases
    cp=ConstraintParser.new
    c,f=cp.parse "c=f"
    c.user_assign(5)
    assert_equal(c.value, f.value)

    c.forget_value "user"
    f.user_assign(567)
    assert_equal(c.value, f.value)
  end

  def test_extremes
    cp=ConstraintParser.new
    c=cp.parse "c=2"
    assert_equal(c.value,2)

    #large equation test
    c,f,g=cp.parse "10/(c-20) = 5*(f+g)"
    f.user_assign(10)
    g.user_assign(1)
    assert_equal(c.value, 570)
  end

  def test_get_connectors
    cp=ConstraintParser.new
    conn_a = ConstantConnector.new("9", 9)
    conn_b = ConstantConnector.new("90", 90)
    conn_c = ConstantConnector.new("99", 99)
    add = Adder.new(conn_a, conn_b, conn_c)

    conn_d = ConstantConnector.new("10", 10)
    conn_e = ConstantConnector.new("5", 5)
    conn_f = ConstantConnector.new("5", 5)
    subb = Subtractor.new(conn_d, conn_e, conn_f)

    g_conn = cp.get_connectors(add, '+', subb)

    assert_equal(g_conn[0..1], [add.out, subb.out])
    assert_instance_of(Connector, g_conn[2])
    assert_equal(g_conn[2].name, "99+5")
    assert_equal(g_conn[2].value, false)
  end

  def test_get_connector
    #Constraint
    cp=ConstraintParser.new
    conn_out = Connector.new("10+0")
    output_original = cp.get_connector(conn_out)
    assert_equal(output_original.class, Connector)
    assert_equal(output_original.name.to_s, "10+0")
    assert_equal(output_original.value.to_s, "false")

    #ArithmeticConstraint
    conn_a = ConstantConnector.new("5", 5)
    conn_b = ConstantConnector.new("6", 6)
    conn_c = Connector.new("eleven")
    add = Adder.new(conn_a, conn_b, conn_c)
    output = cp.get_connector(add)
    assert_equal(output.class, Connector)
    assert_equal(output.name.to_s, "eleven")
    assert_equal(output.value.to_s, "false")

    #already existing one gets same object and not a copy
    output_repeat = cp.get_connector(conn_out)
    assert_true(output_repeat.equal? output_original)
  end

  def test_replace_conn
    cp=ConstraintParser.new
    #No arithmetic
    conn_3 = ConstantConnector.new("3", 3)
    conn_x = Connector.new("x")
    cp.replace_conn(conn_x, conn_3)
    assert_true(conn_x.constraints.length == 1)
    assert_equal(conn_x.constraints, conn_3.constraints)

    #arithmetic left
    cp2=ConstraintParser.new
    conn_y = Connector.new("y")
    conn_x = Connector.new("x")
    conn_6 = ConstantConnector.new("6", 6)
    conn_y6 = Connector.new("y+6")
    cp2.connectors["y"] = conn_y
    cp2.connectors["x"] = conn_x
    cp2.connectors["6"] = conn_6
    cp2.connectors["y+6"] = conn_y6
    add_left = Adder.new(conn_y, conn_6, conn_y6)
    cp2.replace_conn(add_left, conn_x)
    #check intermidiary connector removal
    assert_false(cp2.connectors.keys.include?("y+6"))
    #check that outut redirects into correct connector
    #and that connector recieves right constraint
    assert_true(add_left.out.equal? conn_x)
    assert_true(conn_x.constraints.include? add_left)

    #arithmetic both
    cp2=ConstraintParser.new
    conn_y = Connector.new("y")
    conn_x = Connector.new("x")
    conn_6 = ConstantConnector.new("6", 6)
    conn_12 = ConstantConnector.new("12", 12)
    conn_y6 = Connector.new("y+6")
    conn_x12  = Connector.new("x+12")
    cp2.connectors["y"] = conn_y
    cp2.connectors["x"] = conn_x
    cp2.connectors["6"] = conn_6
    cp2.connectors["12"] = conn_12
    cp2.connectors["y+6"] = conn_y6
    cp2.connectors["x+12"] = conn_x12
    add_right = Adder.new(conn_y, conn_6, conn_y6)
    add_left = Adder.new(conn_x, conn_12, conn_x12)
    cp2.replace_conn(add_left, add_right)

    #check intermidiary connector removal
    assert_false(cp2.connectors.keys.include?("y+6"))
    #check that outut redirects into correct connector
    #and that connector recieves right constraint
    assert_true(add_right.out.equal? conn_x12)
    assert_true(conn_x12.constraints.include? add_right)
  end

  def test_multi_assign_remove
    cp=ConstraintParser.new
    #multi variable
    a,b,c,d = cp.parse "(a+5)*b = 10*c+d"
    a.user_assign(1)
    b.user_assign(2)
    c.user_assign(1)
    assert_equal(d.value, 2)

    #reassignment of new value
    c.forget_value "user"
    c.user_assign(2)
    assert_equal(d.value, -8)

    #corect removal
    a.forget_value "user"
    b.forget_value "user"
    c.forget_value "user"
    assert_equal(a.value, false)
    assert_equal(b.value, false)
    assert_equal(c.value, false)
    assert_equal(d.value, false)

    #no change in non assigned connectors
    d.user_assign(10)
    assert_equal(a.value, false)
    assert_equal(b.value, false)
    assert_equal(c.value, false)
    assert_equal(d.value, 10)
  end

  def test_invalid_equation
    cp=ConstraintParser.new
    assert_raise(Parser::ParseError) {cp.parse "a+b+c"}
  end

end
