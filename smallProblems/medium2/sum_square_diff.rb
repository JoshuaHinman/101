def sum_square_difference(num)
  sum = 0
  square = 0
  1.upto(num) do |count|
    sum += count
    square += count*count
  end
  sum * sum - square
end

puts sum_square_difference(100)