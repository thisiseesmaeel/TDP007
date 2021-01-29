require 'open-uri.rb'

class Table
  Element = Struct.new(:name, :first_value, :second_value) do
    def to_s
      "#{name}: #{second_value} - #{second_value}"
    end
  end

  # Creates a table container holding a list of Element structs based on the data
  # in the match groups of the passed regex. Elements are sorted by the difference
  # between their values, smallest first.
  # Params:
  # +file+:: file to read
  # +regex+:: regex with three match groups (name)(first_value)(second_value)
  # +type+:: symbol representing the type conversion method invoked to convert values to
  def initialize file, regex, type
    rows = []
    file.each_line {|s| rows << s}
    @elements = []
    rows.each do |row|  
      data = regex.match row 
      if data
        @elements << Element.new(data[1], data[2].send(type), data[3].send(type))
      end
    end
    @elements.sort_by!{|element| (element.first_value - element.second_value).abs}
  end

  def first
    @elements[0]
  end

  def [](index)
    @elements[index]
  end

  def to_s
    out = ""
    @elements.each {|element| out << element.to_s << "\n"}
    out
  end
end