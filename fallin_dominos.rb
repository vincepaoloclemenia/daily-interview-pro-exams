string = "LRLRLRLRLR"

def sequence(str)
  arr_str = str.split('')
  arr_str.map.with_index do |c, i|
    if c == '.'
      if arr_str[i + 1] == 'L'
        'L'
      elsif (i - 1 >= 0) && arr_str[ i - 1] == 'R'
        'R'
      else
        c
      end
    elsif c == 'L'
      if i >= 1 && arr_str[i - 1] == 'R'
        '.'
      else
        c
      end
    elsif c == 'R'
      if arr_str[i + 1] == 'L'
        '.'
      else
        c
      end
    end
  end.join('')
end

p "Input is: '#{string}'"

p sequence(string)