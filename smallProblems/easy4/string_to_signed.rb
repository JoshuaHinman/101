def string_to_signed(str)
  sign = ''
  num = 0
  if str[0] == '-' || str[0] == '+'
    sign = str[0]
    str = str[1..-1]
  end
  str = str.bytes
  decimal_place = 10 ** (str.length - 1)
  str.each do |char|
    num += (char - 48) * decimal_place
    decimal_place /= 10
  end
  num = 0 - num if sign == '-'
  num
end


loop do
  puts string_to_signed(gets.chomp)
end