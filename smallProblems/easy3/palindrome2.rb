def palindrome?(str)

  str = str.downcase.chars.select { |char| ('a'..'z').include?(char) || (0..9).include?(char)  }
  # or string = string.downcase.delete('^a-z0-9')
  str.join
  str == str.reverse
end

puts palindrome?("Hello lleh")
puts palindrome?("Satan oscillate my metallic sonatas")