def username(s)
  re = /[a-zA-z]+:\s+/
  m = re.match(s)
  return m.post_match
end

#puts username("udfsdfs: Brian")
