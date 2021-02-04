class String
  def acronym
    str = self.split(" ")
    temp = ""
    for word in str do
      temp += word[0]
    end
    temp.upcase
  end
end
