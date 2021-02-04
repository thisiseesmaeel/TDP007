def factorial(value)
  if value < 1 then 1 else (1..value).inject(&:*) end
end
