# Calculate 20! on a single line with Range#inject
(1..20).inject { |product, n| product * n }

# Generalized function
def factorial(number)
  if (number == 0)
    return 1
  else
    return (1..number).inject { |product, n| product * n }
  end
end
