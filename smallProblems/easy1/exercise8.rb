def average(array)
  array.sum / array.length.to_f
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])

#given solution with reduce
def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum / numbers.count
end

#also
def average(numbers)
  sum = numbers.reduce(:+)
  sum / numbers.count
end
