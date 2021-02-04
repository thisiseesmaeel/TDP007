class PersonName
  def initialize()
    @name = ""
    @surname = ""
  end

  def fullname()
    return "#{@name} #{@surname}"
  end

  def fullname=(rhs)
    k = rhs.split(" ")
    @name = k[0]
    @surname = k[1]
  end
end

# if __FILE__ == $0
  
# end
