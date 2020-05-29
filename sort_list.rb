numbers = [3,1,3,3,2,2,1,1,2]
# [1,2,3,3,3]

def sort_list(array)
  nums = []
  array.each_with_index do |num, ind|
    if ind == 0
      nums << num
    else
      temp = []
      if nums.length > 1 && nums.last == num
        nums << num
      elsif nums.first == num
        nums.unshift(num)
      else
        start = 0
        while num <= nums[start] do
          start += 1
        end
        nums << num if nums.length == 1 && nums[0] <= num
        nums.unshift(num) if nums.lenfth == 1 && nums[0] >= num
        temp = nums.each_slice(start + 1).to_a
        temp << num
        nums = temp.flatten
      end
    end
  end
  nums
end

p sort_list(numbers)