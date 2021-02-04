require 'date'

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

class Person
  def initialize(name="", surname="", age=0)
    @birthyear = DateTime.now.year - age
    @name = PersonName.new(name, surname)
  end

  def get_age()
    return DateTime.now.year - @birthyear
  end

  def get_birthyear()
    return @birthyear
  end

  def get_fullname()
    return @name.fullname
  end

  def set_age(new_age)
    @birthyear = DateTime.now.year - new_age
  end

  def set_birthyear(new_birthyear)
    @birthyear = new_birthyear
  end

  def set_name(new_name)
    @name.fullname=(new_name)
  end
end
