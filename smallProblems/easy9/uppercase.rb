def uppercase?(string)
  string.upcase == string
end

loop do
  p uppercase?(gets.chomp)
end