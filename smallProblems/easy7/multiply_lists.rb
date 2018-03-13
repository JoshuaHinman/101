def multiply_lists(array1, array2)
  array1.zip(array2).map{|arr| arr.inject(:*)}
end

p multiply_lists([2, 2, 3], [3, 4, 4])