def short_long_short(str1, str2)
  if str1.length > str2.length
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end

puts short_long_short("Hey", "Y'all")
puts short_long_short("Hello", "you")
