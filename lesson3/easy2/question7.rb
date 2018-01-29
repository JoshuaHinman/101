flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push("Dino").push("Hoppy")
#or
flintstones.concat(%w(Dino Hoppy))
#or
puts flintstones << "Dino" << "Hoppy"
