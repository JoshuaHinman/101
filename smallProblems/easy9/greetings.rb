def greetings(array,hsh)
  puts " Hello, #{array.join(' ')} you're a fucking #{hsh[:title]} #{hsh[:occupation]}"
end
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
greetings(['Bill', 'Bo', 'Baggins'], {title: 'super', occupation: 'guy'})