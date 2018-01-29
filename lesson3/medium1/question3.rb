def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

p factors(gets.chomp.to_i)

# What is the purpose of the number % dividend == 0 ?
# To determine if number divided evenly by divdend

# What is the purpose of the second-to-last line 
#in the method (the divisors before the method's end)?
# To return the divisors array