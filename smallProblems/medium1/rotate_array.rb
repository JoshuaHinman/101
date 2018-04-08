def rotate_array(array)
  array[1..-1] + [array[0]]
end

arr = [1, 2, 3, 4, 5, 6]
p arr
p rotate_array arr
p arr