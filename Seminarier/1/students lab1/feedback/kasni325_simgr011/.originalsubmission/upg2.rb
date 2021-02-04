def fac(n)
  if n == 0
    return 1
  else
    (1..n).inject {|total,x| total * x}
  end
end
