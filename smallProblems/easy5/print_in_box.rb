def print_in_box(message)
  width = message.length
  puts '+' + "-"*width + '+'
  puts '|' + " "*width + '|'
  puts '|' + message + '|'
  puts '|' + " "*width + '|'
  puts '+' + "-"*width + '+'
end


loop do
  print_in_box gets.chomp
end