def sum_of_sums(array)
  output = 0
  count = 1
  while count <= array.length
    output += array.slice(0, count).reduce(:+)
    p output
    count +=1
  end
  output
end

p sum_of_sums([3, 5, 2])