def titleize(arr)
  arr.split.each{|v| v.capitalize!}.join(' ')
end

s = "I dressed up as Charlie Manson for Haloween"

puts titleize(s)