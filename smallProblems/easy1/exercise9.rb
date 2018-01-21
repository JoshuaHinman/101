def sum(num)
  num.to_s.split(//).map{ |m| m.to_i}.reduce(:+)
end
puts sum(1234567)

#given solution
def sum2(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end