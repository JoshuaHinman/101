def reverse(array)
  new_arr = Array.new(array.length)
  array.each_with_index {|val, idx| new_arr[-(idx + 1)] = val}
  # array.reverse_each {|val| new_arr << val}
  new_arr
end

arr = %w(1 2 3 4 5 6 7 8 9 10 11 12)

p arr
p reverse(arr)