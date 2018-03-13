def hexadecimal_to_integer(str)
  num = 0
  str = str.bytes
  decimal_place = 10 ** (str.length - 1)
  str.each do |char|
    num += (char - 48) * decimal_place
    decimal_place /= 10
  end
  num
end

p string_to_integer('256') * 2
