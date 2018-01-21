def bonus( salary , yn)
  yn ? salary/2 :  0
end

puts bonus 24000 , true
puts bonus 10000 , false
puts bonus 10000000, false
