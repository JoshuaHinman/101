def show_multiplicative_average(array)
  result = array.inject(:*).to_f / array.length.to_f
  puts format('%.3f', result)
  # or 
  puts result.round(3)
end

show_multiplicative_average([3, 8, 5])

