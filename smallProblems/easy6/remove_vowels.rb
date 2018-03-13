def remove_vowels(words)
  words.map {|word| word.delete('aeiouAEIOU')}
  # words.map { |word| word.scan(/[^aeiouAEIOU]/).join }
  # words.map { |str| str.gsub(/[aeiou]/i, '') }
end

loop do
  puts remove_vowels(gets.chomp.split)
end