def bubble_sort(array)
  return array if array.size <= 1
  swap = true
    while swap do
      swap = false
      (array.length - 1).times do |x|
        if array[x] > array[x+1]
          array[x], array[x+1] = array[x+1], array[x]
          swap = true
        end
      end
    end
  array
end

arr.each_with_index do |v, i|
  if i != arr.size - 1
    if v > arr[i+1]
      arr[i], arr[i+1] = arr[i+1], arr[i]
    end
  end
end