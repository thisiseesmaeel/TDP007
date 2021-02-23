#!/usr/bin/env ruby

# ----------------------------------------------------------------------------
#  Unidirectional constraint network for logic gates
# ----------------------------------------------------------------------------

# This is a simple example of a constraint network that uses logic gates.
# There are three classes of gates: AndGate, OrGate, and NotGate.
# Connections between gates are modelled as the class Wire.

require 'logger'
# ----------------------------------------------------------------------------
#  Bidirectional constraint network for arithmetic constraints
# ----------------------------------------------------------------------------

# In the example above, our constraint network was unidirectional.
# That is, changes could not propagate from the output wire to the
# input wires. However, to model equation systems such as the
# correlation betwen the two units of measurement Celsius and
# Fahrenheit, we need to propagate changes from either end to the
# other.

module PrettyPrint

  # To make printouts of connector objects easier, we define the
  # inspect method so that it returns the value of to_s. This method
  # is used by Ruby when we display objects in irb. By defining this
  # method in a module, we can include it in several classes that are
  # not related by inheritance.

  def inspect
    "#<#{self.class}: #{to_s}>"
  end

end

# This is the base class for Adder and Multiplier.

class ArithmeticConstraint

  include PrettyPrint

  attr_accessor :a,:b,:out
  attr_reader :logger,:op,:inverse_op
  def initialize(a, b, out)
    @logger=Logger.new(STDOUT)
    @a,@b,@out=[a,b,out]
    [a,b,out].each { |x| x.add_constraint(self) }
  end

  def to_s
    "#{a} #{op} #{b} == #{out}"
  end

  def new_value(connector)
    if [a,b,out].include?(connector) and (a.has_value? or b.has_value? ) and
       (a.has_value? or out.has_value?) and (b.has_value? or out.has_value? )
      empty_index = false
      full_index = []
      [a,b,out].each_with_index do |con, i|
        if con.has_value?
          full_index.append con
        else
          empty_index = i
        end
      end
      # Inputs changed, so update output to be the sum of the inputs
      # "send" means that we send a message, op in this case, to an
      # object.
      if empty_index == 2
        val=full_index[0].value.send(op, full_index[1].value)
      else
        val=full_index[1].value.send(inverse_op, full_index[0].value)
      end
      logger.debug("#{self} : #{[a,b,out][empty_index]} updated")
      [a,b,out][empty_index].assign(val, self)
    end
    self
  end

  # A connector lost its value, so propagate this information to all
  # others
  def lost_value(connector)
    ([a,b,out]-[connector]).each { |connector| connector.forget_value(self) }
  end

end

class Adder < ArithmeticConstraint

  def initialize(*args)
    super(*args)
    @op,@inverse_op=[:+,:-]
  end
end

class Subtractor < ArithmeticConstraint

  def initialize(*args)
    super(*args)
    @op,@inverse_op=[:-,:+]
  end
end

class Multiplier < ArithmeticConstraint

  def initialize(*args)
    super(*args)
    @op,@inverse_op=[:*,:/]
  end

end

class Divider < ArithmeticConstraint

  def initialize(*args)
    super(*args)
    @op,@inverse_op=[:/,:*]
  end

end

class ContradictionException < Exception
end

# This is the bidirectional connector which may be part of a constraint network.

class Connector

  include PrettyPrint
  attr_reader :constraints
  attr_accessor :name,:value

  def initialize(name, value=false)
    @name=name
    @has_value=(not value.eql?(false))
    @value=value
    @informant=false
    @constraints=[]
    @logger=Logger.new(STDOUT)
  end

  def add_constraint(c)
    @constraints << c
  end

  # Values may not be set if the connector already has a value, unless
  # the old value is retracted.
  def forget_value(retractor)
    if @informant==retractor then
      @has_value=false
      @value=false
      @informant=false
      @logger.debug("#{self} lost value")
      others=(@constraints-[retractor])
      @logger.debug("Notifying #{others}") unless others == []
      others.each { |c| c.lost_value(self) }
      "ok"
    else
      @logger.debug("#{self} ignored request")
    end
  end

  def has_value?
    @has_value
  end

  # The user may use this procedure to set values
  def user_assign(value)
    forget_value("user")
    assign value,"user"
  end

  def assign(v,setter)
      if not has_value? then
        @logger.debug("#{name} got new value: #{v}")
        @value=v
        @has_value=true
        @informant=setter
        (@constraints-[setter]).each { |c| c.new_value(self) }
        "ok"
      else
        if value != v then
          raise ContradictionException.new("#{name} already has value #{value}.\nCannot assign #{name} to #{v}")
      end
    end
  end

  def to_s
    name
  end

end

class ConstantConnector < Connector

  def initialize(name, value)
    super(name, value)
    if not has_value?
      @logger.warn "Constant #{name} has no value!"
    end
  end

  def value=(val)
    raise ContradictionException.new("Cannot assign a constant a value!")
  end
end

def celsius2fahrenheit
  f = Connector.new("f")
  c = Connector.new("c")
  res = Connector.new("res")
  mult = ConstantConnector.new("mult", 1.8)
  add = ConstantConnector.new("add", 32)
  Multiplier.new(mult, c, res)
  Adder.new(res, add, f)
  [c,f]
end
