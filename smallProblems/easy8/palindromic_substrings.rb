def all_substrings(string)
  out_arr = []
  0.upto(string.length - 1) do |lp|
    lp.upto(string.length - 1) do |seg|
    out_arr << string[lp..seg]
    end
  end
  out_arr
end

def palindromic_substrings(string)
  string = all_substrings(string)
  string.select do|sub|
    sub.downcase!
    sub == sub.reverse && sub.length > 1
  end
end

s = 'KniTTing CasseTTes'
p palindromic_substrings(s)

p s