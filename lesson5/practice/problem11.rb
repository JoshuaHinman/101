arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 = arr.map do |a|
  a.select {|n| n%3 == 0}  
end

p arr2

# returns same array structure with only multiples of 3