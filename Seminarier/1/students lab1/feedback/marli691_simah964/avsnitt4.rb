#Uppgift 10
def get_username(string)
captured_name = string.match(/:\s*([A-Za-z]+)/)
captured_name[1]
end
#puts get_username("USERENAME: Brian")
#puts get_username("RANdOMTEXdwa:Nisse")


#Uppgift 12
def regnr(regplate)
  if regplate.match?(/\b([^IQVa-z]{3}[0-9]{3})\b/)
    matched_regplate = regplate.match(/\b([^IQVa-z]{3}[0-9]{3})\b/)
    return matched_regplate[1]
  else
    return false
  end 
end

=begin
puts regnr("Min bil heter FMA297 ")
puts regnr("Min bil heter FMA297.")
puts regnr("Min bil heter FMA297")
puts regnr("FMA297")
puts regnr("Min bil heterFMA297.")
puts regnr("Men in bil heter QTB987")
puts regnr("Och min heter ABC12 3")
puts regnr("ABC1234")
puts regnr("ABCD123")
=end
