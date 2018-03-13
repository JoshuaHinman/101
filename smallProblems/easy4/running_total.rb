def running_total(arr)
  accumulator = 0
  total_arr = []
  arr.each do |num|
    accumulator += num
    total_arr << accumulator
  end
  total_arr
end

def running_total2(array)
  sum = 0
  array.map { |value| sum += value }
end


puts running_total([2,5,8,1,2,6,2])