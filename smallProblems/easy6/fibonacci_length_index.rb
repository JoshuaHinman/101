def fibonacci_length_index(num)
  last_1 = 0
  last_2 = 0
  value = 1
  index = 1
  while value.to_s.length != num
    last_2 = last_1
    last_1 = value
    value = last_1 + last_2
    index += 1
  end
  index
end

p fibonacci_length_index(10)
