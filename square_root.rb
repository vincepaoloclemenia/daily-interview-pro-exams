integer = 25

def get_sqr_root(int)
  n = 1.000
  sqr = 0
  while (sqr <= int) do
    n += 0.001 
    sqr = n * n
  end 
  n.truncate(3)
end



p get_sqr_root integer