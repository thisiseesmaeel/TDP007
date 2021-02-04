def regnr(s)
  re = /[A-HJ-PR-UW-Z]{3}\d{2}([A-HJ-NPR-UW-Z]|\d)/
  md = re.match(s)
  if md != nil then return md[0] else return false end
end

puts regnr("Mitt regnummer är TGS81O, på min bil alltså.")
