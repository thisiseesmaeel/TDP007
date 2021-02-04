def get_name(string)
  name = /(?<=([A-Z]|[a-z]): )([A-Z]|[a-z])+/.match(string)
  return name[0]
end
