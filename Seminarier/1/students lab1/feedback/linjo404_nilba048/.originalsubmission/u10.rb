def username(string)
  re = /[a-zA-Z]+\:\s/
  if md = re.match(string)
    return md.post_match
  else 
    return false
  end
end
