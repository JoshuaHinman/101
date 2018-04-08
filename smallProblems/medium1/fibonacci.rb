def fibonacci(num)
  current = 1
  back_1 = 1
  back_2 = 0
  (num - 2).times do
    back_2 = back_1
    back_1 = current
    current = back_1 + back_2
  end
  current
end

def fibonacci_last(num)
  fibonacci(num) % 10
end

loop do
  p fibonacci_last(gets.chomp.to_i)
end