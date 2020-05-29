string1 = "milktea"
string2 = "level"

def determine_if_palindrome(str)
  reversed_string = Array.new.tap do |array|
                      (str.length - 1).downto(0) do |n| 
                        array << str[n]
                      end
                    end.join("")
  if reversed_string == str
    "#{str} is a palindrome"
  else
    "#{str} is not a palindrome"
  end
end

p determine_if_palindrome(string1)
p determine_if_palindrome(string2)