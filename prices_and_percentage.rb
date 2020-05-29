def get_price_and_percentage
  puts "Enter price with tax:"
  price = gets.chomp
  puts "Enter percentage"
  percentage = gets.chomp.to_i
  (percentage > 0 && percentage < 100) or raise "Percentage must be between 1-99"
  price_computation(price, percentage)
end

def price_computation(price, percentage)
  percentage.is_a?(Integer) or raise "Percentage must be number"
  price.is_a?(String) or raise "Price must be in currency format"
  currency = price.tr('^A-Za-z', '')
  price = price.gsub(/[^\d\.]/, '').to_f

  tax_exclusive = price / (1 + (percentage.to_f / 100.0))

  puts "#{currency} #{tax_exclusive.round(2)}"
end

get_price_and_percentage
