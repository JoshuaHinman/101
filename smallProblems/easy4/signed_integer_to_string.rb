def integer_to_str (num)
  str = ''
  while num != 0
    digit = num % 10
    str.prepend((digit + 48).chr)
    num /= 10
  end
  str
end

def signed_integer_to_string(num)
  num < 0 ? sign = '-' : sign = '+'
  num = num.abs
  num != 0 ? integer_to_str(num).prepend(sign) : '0'
end

loop do
  p signed_integer_to_string(gets.chomp.to_i)
end

