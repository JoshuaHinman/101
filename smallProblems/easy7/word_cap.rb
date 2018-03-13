def word_cap(string)
  string.split.map{|word| word.downcase.capitalize}.join(' ')
end

p word_cap "hello my name is simon"