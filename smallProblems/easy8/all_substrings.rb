def sort_by_substring(string)
  out_arr = []
  0.upto(string.length - 1) do |seg|
    out_arr << string[0..seg]
  end
  out_arr
end

def all_substrings(string)
  out_arr = []
  0.upto(string.length)
    out_arr << sort_by_substring string.slice(0, seg)
  out_arr
end