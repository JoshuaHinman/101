def leap_year(year)
  year % 4 == 0 && ((year % 100 != 0) || year % 400 == 0)
end

loop do 
  puts leap_year(gets.chomp.to_i)
end