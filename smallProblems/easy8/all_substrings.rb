def all_substrings(string)
  out_arr = []
  0.upto(string.length - 1) do |lp|
    lp.upto(string.length - 1) do |seg|
    out_arr << string[lp..seg]
    end
  end
  out_arr
end

p all_substrings('hello')