def palindrome_num?(str)
  str = str.to_s
  str == str.reverse
end

puts palindrome_num?(121)
puts palindrome_num?(986896)