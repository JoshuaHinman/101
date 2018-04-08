def fibonacci(num)
  return 1 if num <= 2
  fibonacci(num - 1) + fibonacci(num - 2)
end

loop do
  p fibonacci(gets.chomp.to_i)
end