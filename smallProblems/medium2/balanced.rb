def balanced?(string)
  balance = 0
  string.split('').each do |char|
    balance += 1 if char == '('
    balance -= 1 if char == ')'
    return false if balance < 0
  end
  balance == 0 ? true : false
end

loop do
  puts balanced?(gets.chomp)
end