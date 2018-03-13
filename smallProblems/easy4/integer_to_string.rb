def integer_to_str (num)
  str = ''
  while num != 0
    digit = num % 10
    str.prepend((digit + 48).chr)
    num /= 10
  end
  str
end

def signed_int_to_string(num)
  sign = ''
  if num < 0
    sign = '-'
    num -= num * 2
  else
    sign = "+"
  end
  integer_to_str(num).prepend(sign)
end

loop do
  p signed_int_to_string(gets.chomp.to_i)
end

