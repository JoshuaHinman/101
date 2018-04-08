def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_digit(number, idx)
  seg1 = number.to_s.chars.slice(0..-(idx + 1))
  seg2 = rotate_array(number.to_s.chars.slice(-idx..-1))
  seg1.concat(seg2).join.to_i
end

p rotate_digit(123456, 6)