str1 = "polcp"
str2 = "level"
str3 = "madam"
str4 = "1234abcdefghijihgfedcba4321"

def palindrome?(str)
  if str.length == 1 || str.length == 0
    return "is a palindrome"
  else
    if str[0] != str[-1]
      return "is NOT a palindrome"
    else
      palindrome?(str[1..-2])
    end
  end
end

# On the following outputs, we used #{} to concatenate strings
p "#{str1} #{palindrome?(str1)}" 
 
p "#{str2} #{palindrome?(str2)}"

p "#{str3} #{palindrome?(str3)}"

p "#{str4} #{palindrome?(str4)}"