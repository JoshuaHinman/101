#my solution
def reverse_words(sentence)
  array = sentence.split
  array.each_with_index do |word , index|
    array[index].reverse! if word.length >= 5
  end
  array.join(" ")
end

puts reverse_words("The longer words are backwards")

#given solution
def reverse_words2(sentence)
  array=[]
  sentence.split.each do |word|
    word.reverse! if word.size >=5
    array << word
  end
  array.join(' ')
end

puts reverse_words2 ("Here is another example of backwards strings")

#intersting solution from eggy1224
def reverse_words3(str)
  str.split.map { |word| word.length >= 5 ? word.reverse : word }.join(' ') 
end

