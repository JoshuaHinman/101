def interleave(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |val, idx|
    new_arr << val << arr2[idx]
  end
  new_arr
end

p interleave([1, 2, 3, 4, 5], ['a', 'b', 'c', 'd', 'e'])