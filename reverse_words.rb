
string = "can you read this"

def reverse_words(str)
  Array.new.tap do |array|
    arr = str.split(" ")
    (arr.size - 1).downto(0) do |n|
      array << arr[n]
    end
  end.join(" ")
end


p reverse_words(string)