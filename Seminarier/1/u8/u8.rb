class String
  def acronym
    return self.split.map { |word| word[0].upcase }.join
  end
end
