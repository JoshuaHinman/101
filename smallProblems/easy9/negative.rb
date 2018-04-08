def negative(num)
  if num > 0
    0 - num
  else
    num
  end
end

loop do
  p negative(gets.chomp.to_i)
end