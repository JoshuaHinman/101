def double_number(number)
  number = number.to_s
  if number[0,number.length / 2 -1] == number[number.length / 2, number.length / 2 -1]
    number.to_i
  else
    0
  end
end

p double_number(4444)
p double_number(433433)

