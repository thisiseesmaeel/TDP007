class String
  def acronym
    arr = self.split
    acro = ""
    arr.each { |item| acro << item[0].upcase }
    acro
  end

end
