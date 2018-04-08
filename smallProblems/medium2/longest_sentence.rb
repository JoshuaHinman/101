text = File.read('frankenstein.txt').split
longest_sequence = 0
current_sequence = 0
longest_sentence = ''
sentence = ''
text.each do |word|
  sentence << word << ' '
  end_char = word.split('').last
  if end_char == "." || end_char == "!" || end_char == "?"
    if current_sequence > longest_sequence
      longest_sequence = current_sequence + 1
      longest_sentence = sentence
    end
    current_sequence = 0
    sentence = ''
  else
    current_sequence += 1
  end
end

puts longest_sentence
puts "Most words: #{longest_sequence}"