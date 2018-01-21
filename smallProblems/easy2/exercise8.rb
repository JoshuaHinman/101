puts "Please enter an integer greater than 0:"
num = gets.chomp.to_i
puts "Enter 's' to compute the sum, 'p' to compute the product."
op = gets.chomp

count = num
if op.downcase == 's'
  total = 0
  while count > 0
    total += count
    count -= 1
  end
    puts "The sum of the integers between 1 and #{num} is #{total}"
elsif op.downcase == 'p'
  total = 1
  while count > 0
    total *= count
    count -= 1
  end
    puts "The product of the integers between 1 and #{num} is #{total}"
end
    