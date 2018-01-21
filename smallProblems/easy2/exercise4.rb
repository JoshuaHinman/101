puts "What is your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i
left = retirement_age - age
year = Time.now.year
puts "It's 2018.  You will retire in #{year + left}."
puts "You have only #{left} years of work to go!"
