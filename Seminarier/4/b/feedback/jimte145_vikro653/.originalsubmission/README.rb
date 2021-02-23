# coding: iso-8859-1
#################################################################### 
# README, Read this first for making opponering easier.
#################################################################### 

# We had a total of three versions of uppgift 2 and four days of 
# development which generated a shit ton of code.

# Instead of making you read all that code with some comments in 
# between we have made a summary of the most notable changes along
# the way. The english comments represent our thoughts at the moment.

# This is an attempt to make it easier to present examples 
# at the opponering. The comments in swedish from date of development
# have been left in, but are not crucial. 

# We hope this helps. Best regards: Daniel and Theodore


# If you have further questions you may ask Daniel on Discord.

#################################################################### 
# VERSION 1 constraint-parser.rb
####################################################################

# Unfortunately this function was untouched for a long time.
# It probably increased development time for about a day.
# Looking back it was probably because we thought we could 
# bruteforce it like the first excercise.
  def get_connectors(conn_a,op,conn_b)
    if conn_a.is_a?(ArithmeticConstraint)
      [conn_a.a,conn_a.b,conn_a.out]
    elsif conn_b.is_a?(ArithmeticConstraint)
      [conn_b.a,conn_b.b,conn_b.out]
    else
      name_c="#{conn_a.name}#{op}#{conn_b.name}"
      conn_c=Connector.new(name_c)
      @connectors[name_c]=conn_c
      [conn_a,conn_b,conn_c]
    end
  end

  # Kolla om connector eller arithemetic constraint.
  # Bytte == mot .is_a? så funkade det som förväntat.
  def get_connector(entity)
    puts "ENTITY CLASS: #{entity.class}"
    if entity.is_a?(Connector)
      entity
    elsif entity.is_a?(ArithmeticConstraint)
      entity.out
    # elsif entity.is_a?(Integer)
    #   ConstantConnector.new(entity.to_s, entity)
    else
      
    end
  end

### GoTo method was to put prints so we could see what each part did but
### it became so clouded with prints in the end didn't know what we were looking for or why.
### The constant changing of ifs and elsifs without a proper testfile really
### screwed us over. After this we started writing the testfile.
  def replace_conn(lh,rh)
    lh_conn, rh_conn=[get_connector(lh),get_connector(rh)]
    puts "lh: #{lh.name}\t rh: #{rh.value}"
    puts "lh_conn class: #{lh_conn.class} rh_conn class: #{rh_conn.class}"
    conn,expr=[nil,nil]
    if rh.is_a?(ArithmeticConstraint) then
      expr,conn=rh,lh_conn
      puts "INSIDE RH expr class: #{expr.class} conn class: #{conn.class}"
      @connectors.delete(rh_conn.name)
    elsif rh.is_a?(Connector) then
      conn = rh
    elsif lh.is_a?(ArithmeticConstraint) then
      expr,conn=lh,rh_conn
      puts "INSIDE LH expr class: #{expr.class} conn class: #{conn.class}"
      @connectors.delete(lh_conn.name)
    elsif lh.is_a?(Connector)
      conn = lh
    end
    if expr != nil and conn != nil
      puts "expr class: #{expr.class} conn class: #{conn.class}"
      expr.out=conn
      conn.add_constraint(expr)
    end
  end

#################################################################### 
# VERSION 2 constraint-parser.rb
####################################################################

# IN VERSION 2 WE ADDED TESTS IN THE PARSER FILE FOR CONTROL.
# THIS WAS BAD SINCE A LOT OF TIME WENT INTO PROCEDURALLY CHANGING THEM.
# AFTER A CERTAIN AMOUNT OF TIME WE COULDN'T GUARANTEE WHAT OUR PROGRAM
# COULD AND COULD NOT DO.
# Test:

cp=ConstraintParser.new
a,b = cp.parse "(16/b)=(a+1)"
a,b = cp.parse "(a+5=b+3)"
a.user_assign 7
puts b.value
puts cp.parse "a+1=b"
c,f=cp.parse "a=b"

CAN DO
c,f=cp.parse "(9*c)=(f+1)"
c,f=cp.parse "9*c=f*1"
c.user_assign 10
puts f.value

CAN NOT DO
c,f=cp.parse "9*c=f+1"
f,a = cp.parse "2*(f+6)=a"

c,f = cp.parse "9*c=5*(f-32)"

#################################################################### 
# FINAL VERSION constraint-parser.rb
####################################################################


  def get_connectors(conn_a,op,conn_b)
    # Same solution as row 115, our missing link.
    conn_a,conn_b = get_connector(conn_a), get_connector(conn_b)
    name_c="#{conn_a.name}#{op}#{conn_b.name}"
    conn_c=Connector.new(name_c)
    @connectors[name_c]=conn_c
    [conn_a,conn_b,conn_c]
  end

def replace_conn(lh,rh)
  # This line below was a breakthrough. Felt pretty obvious when we 
  # found out.
    lh_conn,rh_conn=[get_connector(lh),get_connector(rh)]
    conn,exp=[nil,nil]
    if rh.is_a?(ArithmeticConstraint) then
      exp,conn=rh,lh_conn
      @connectors.delete(rh_conn.name)
    elsif lh.is_a?(ArithmeticConstraint) then
      exp,conn=lh,rh_conn
      @connectors.delete(lh_conn.name)
    # Really nice fix to make it possible to handle a=b expressions. 
    elsif lh.is_a?(Connector) and rh.is_a?(Connector) then
      nil_connector = ConstantConnector.new("0", 0)
      exp = Adder.new(nil_connector, lh, rh)
      conn = rh
    end
    exp.out=conn
    conn.add_constraint(exp)
  end
