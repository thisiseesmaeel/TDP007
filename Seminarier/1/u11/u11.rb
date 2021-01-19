def regnr(string)
  re = /([A-Z]{3}[0-9]{3})/
  if md = re.match(string)
    return md[0]
  else 
    return false
  end
end
