def stringy(num)
  putZero = false
  output =''
  while num > 0 do
    putZero ? output<<'0' : output<<'1'
    putZero = !putZero
    num -=1
  end
  return output
end
puts "enter a number:"
puts stringy (gets.to_i)


