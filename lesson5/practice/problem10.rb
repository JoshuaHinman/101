#returns array of values
arr2 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |h|
  h.values.map {|v| v += 1}
end

p arr2

#returns hash
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

p arr