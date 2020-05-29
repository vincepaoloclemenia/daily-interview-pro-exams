class SoundexEncode

  CODE_HASH = {
    1 => ["B", "F", "P", "V"],
    2 => ["C", "G", "J", "K", "Q", "S", "X", "Z"],
    3 => ["D", "T"],
    4 => ["L"],
    5 => ["M", "N"],
    6 => ["R"]
  }
  VOWELS_REGEXP = /[aeiouAEIOU]/
  attr_reader :surname
  def initialize
    puts "Enter surname"
    input = gets.chomp
    @surname = input
    @first_char_excluded = input[1..surname.length]
    @removed_vowels = @first_char_excluded.gsub(VOWELS_REGEXP, '')
  end

  def encode_surname_using_case
    filtered_array = @removed_vowels.split("").map.with_index do |char, index|
      case char.upcase
      when "B", "F", "P", "V"
        1
      when "C", "G", "J", "K", "Q", "S", "X", "Z"
        2
      when "D", "T"
        3
      when "L"
        4
      when "M", "N"
        5
      when "R"
        6
      when "H", "W"
        nil
      else
        0
      end
    
    end.
    reject(&:nil?)
    
    "Soundex code surname using case is #{surname[0] + digit_codes(filtered_array)}"
  end

  def encode_surname_using_hash
    filtered_array = @removed_vowels.split("").map.with_index do |char, index|
            char = char.upcase 
            CODE_HASH.keys.detect do |key| 
              CODE_HASH[key].include?(char)
            end
          end.
          reject(&:nil?)

    "Soundex code surname using hash is #{surname[0] + digit_codes(filtered_array)}"
  end

  private

    def digit_codes(filtered_array)
      filtered_codes = filtered_array.map.with_index do |num, index|
        if num == filtered_array[index + 1]
          nil
        else
          num.to_s
        end
      end.reject(&:nil?).first(3)
  
      while filtered_codes.size != 3 do
        filtered_codes << "0"
      end
      
      filtered_codes.join("")
    end
end


soundex_code = SoundexEncode.new

# Get code using case
puts soundex_code.encode_surname_using_case

# Get code using hhash
puts soundex_code.encode_surname_using_hash

