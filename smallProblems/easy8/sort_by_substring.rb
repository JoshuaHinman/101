def sort_by_substring(string)
  out_arr = []
  0.upto(string.length - 1) do |seg|
    out_arr << string[0..seg]
  end
  out_arr
end

p sort_by_substring('234567')