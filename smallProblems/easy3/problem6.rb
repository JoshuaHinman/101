def oddities (arr)
  new_arr = []
  indx = 0
  while indx < arr.length - 1
    new_arr << arr[indx]
    indx += 2
  end
  new_arr
end

puts oddities [2,3,4,5,6,7,8,9]