def find_dupe(array)
  dupe = 0
  array.each{|val| array.count(val) == 2 ? dupe = val : 0}
  # array.find { |element| array.count(element) == 2 }
  dupe
end

p find_dupe([1, 2, 3, 4, 7, 8, 3])