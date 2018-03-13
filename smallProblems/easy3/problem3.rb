puts "Please write a word or multiple words:"
ans = gets.chomp

count = 0
#ans.split.each do |word|
#  count += word.length
#end
count = ans.delete(' ').size
puts "There are #{count} letters in \" #{ans}\"."