def determine_grid(x, y)
  a, b, ctr = 1, 1, 0
  if (x <= 0 && y <= 0) || ( x == 1 && y == 1)
    0
  elsif x == 0 && y > 0
    y - 1
  elsif x > 0 && y == 0
    x - 1
  elsif x == y
    x + y - 2
  else
    until ( a == x && b == y ) do
      [x, y].each do |c|
        if c == y && b < y
          b += 1
          ctr += 1
        elsif c == x && a < x
          a += 1
          ctr += 1
        end
      end
    end  
    ctr     
  end
end

p determine_grid(3, 3)