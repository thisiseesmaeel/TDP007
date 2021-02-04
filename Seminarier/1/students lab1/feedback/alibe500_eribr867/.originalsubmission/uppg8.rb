class String
  def acronym
    acronym = ""
    self.split.each { |item| acronym += item[0].upcase }
    
    return acronym

  end
end

