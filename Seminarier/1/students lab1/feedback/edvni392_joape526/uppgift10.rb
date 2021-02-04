def parse_string(string)
  re = /(USERNAME:\s)([a-zA-Z]{3,12}\b)/i
  if re.match?(string)
    return re.match(string)[2]
  end
  return nil
end

