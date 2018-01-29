counter = 0
r = ['ant', 'bear', 'cat', 'dog', 'elephant', 'frog'].each_with_object([]) do |value, hash|
  counter += 1
  hash[counter] = value
end

puts r