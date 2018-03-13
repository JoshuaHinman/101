def reverse!(array)
  count = 1
  while count <= array.length / 2
    # array[count - 1] , array[-count] = array[-count], array[count - 1]
    swap = array[count - 1]
    array[count - 1] = array[-count]
    array[-count] = swap
    count += 1
  end
  puts array.object_id
  array
end

arr = %w(1 2 3 4 5 6 7 8 9 10 11 12)

puts arr.object_id
p reverse!(arr)