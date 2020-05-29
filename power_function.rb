
input_a = 10
input_b = 5

def get_power_of(int, multiplier)
  return int if (int == 1 || multiplier == 1)
  multiplier -= 1
  if multiplier != 0
    return int * get_power_of(int, multiplier)
  end
end


p get_power_of(input_a, input_b)