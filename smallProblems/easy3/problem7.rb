def palindrome?(str)
  str = str.split('')
  p str
  while str.size > 1
    if str[0] != str[str.length - 1]
      return false
    end
    str.delete_at(0)
    str.delete_at(str.length - 1)
    p str
  end
  true
end

puts palindrome?("hihih")
puts palindrome?("mesaydayo")
