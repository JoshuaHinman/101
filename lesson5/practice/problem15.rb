arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr2 = arr.select do |h|
  h.all? do |k, v|
    v.all? {|n| n.even?}
  end
end

p arr2

#iterates over each seperate hash and selects it only if
#all integers in each k/v pair are even