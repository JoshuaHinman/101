def triangle(size)
  (size + 1).times{|n| puts " " * (size - n) + "*" * n}
end

triangle(gets.chomp.to_i)