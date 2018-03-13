arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hash ={}
arr.each do |a|
  hash[a[0]] = a[1]
end

p hash

# creates hash from source array where first member is key, second is value