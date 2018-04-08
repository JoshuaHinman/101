def index_rotate_left(arr, idx)
  move = arr.delete_at(idx)
  arr << move
end

def max_rotation(num)
  number = num.to_s.chars
  p number
  0.upto(number.length - 2) do |idx|
    p idx
    number = index_rotate_left(number, idx)
  end
  number.join.to_i
end

p max_rotation(735291)