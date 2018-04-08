def featured(number)
  test_num = (number / 7 + 1) * 7
  loop do
    unique_digits = number.to_s.chars.uniq == number.to_s.chars
    break if test_num.odd? && unique_digits
    test_num += 7
  end
  test_num
end
loop do
  puts featured(gets.chomp.to_i)
end

