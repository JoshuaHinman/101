flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "Bambam"]
hashstones = {}
flintstones.each_with_index do |v, i|
  hashstones[v] = i
end

p hashstones