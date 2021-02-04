def regnr(string)
  re = /((?![QIV])[A-Z]{1}){3}[\d]{3}/
  if md = re.match(string)
    return md[0]
  else
    return false
  end
end
