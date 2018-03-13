def swapcase(string)
  # string.chars.map{|ch| ('a'..'z').include?(ch) ? ch.upcase : ch.downcase}.join
  string.chars.map{|ch| ch =~ /[a-z]/ ? ch.upcase : ch.downcase}.join
end

p swapcase "Hello my name is Simon"