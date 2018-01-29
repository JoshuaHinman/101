statement = "The Flintstones Rock"

hash = {}
statement.split(//).each do |v|
  v.downcase!
  hash.has_key?(v) ? hash[v] += 1 : hash[v] = 1
end

p hash.sort