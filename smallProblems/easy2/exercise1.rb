def age(name ="Teddy")
  puts "#{name}'s age is #{rand(20..200)}"
end

puts "Give me a name:"
person = gets.chomp
person.empty? ? age : age(person)
