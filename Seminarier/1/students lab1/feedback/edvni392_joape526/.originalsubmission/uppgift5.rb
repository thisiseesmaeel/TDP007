class PersonName

    attr_reader :name, :surname

    def initialize(name, surname)
        @name = name
        @surname = surname
    end

    def fullname
        return "#{name} #{surname}"
    end

    def fullname=(fullname)
        @name, @surname = fullname.split
    end
end
    
