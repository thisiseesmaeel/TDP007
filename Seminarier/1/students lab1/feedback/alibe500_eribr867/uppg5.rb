class PersonName
  def initialize(name, surname)
    @name = name
    @surname = surname
  end

  def fullname()
    return "#{@name} #{@surname}"
  end

  def fullname=(new_fullname)
    fullname_array = new_fullname.split(/ /, 2)
    @name = fullname_array[0]
    @surname = fullname_array[1]
  end
end


