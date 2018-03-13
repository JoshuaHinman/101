def include?(array, val)
  array.each{|test| return true if test == val}
  false
end

p include?([1, 2, 3, 4, 5, 6, 7], 9)