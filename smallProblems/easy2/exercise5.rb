print "What is your name?"
name = gets.chomp

name[0] = name[0].upcase
if name[-1] =='!'
  name = name.chop
  puts "Hello #{name.upcase}.  Why are we yelling?"
else
  puts "Hello #{name}"
end
