arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr2 = arr.sort_by do |a|
  a.select {|n| n.odd?}
end

p arr2

# sorts arrays by odd numbers only