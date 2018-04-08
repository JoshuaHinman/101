def swap_name(first_last)
  first_last.split(' ').reverse.join(' ')
end

loop do
  puts "Enter first and last name"
  p swap_name(gets.chomp)
end