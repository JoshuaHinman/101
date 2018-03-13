numbers = ['1st', '2nd', '3rd', '4th', '5th', 'last']
answers = []
6.times do |num|
  puts "Enter the #{numbers[num]} number"
  answers << gets.chomp
end

last = answers.pop

if answers.include?(last)
  puts "The number #{last} appears in #{answers}"
else
  puts "The number #{last} does not appear in #{answers}"
end