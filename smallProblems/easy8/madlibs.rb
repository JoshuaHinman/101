def get_word(message)
  puts message
  gets.chomp
end

noun = get_word "Enter a noun:"
verb = get_word "Enter a verb"
adjective = get_word "Enter an adjective:"
adverb = get_word "Enter an adverb:"

puts "Every morning, I #{verb} #{adverb} with a #{adjective} #{noun}"



