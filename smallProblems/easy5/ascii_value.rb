def ascii_value(str)
  str.bytes.sum
end

loop do
  p ascii_value(gets.chomp)
end