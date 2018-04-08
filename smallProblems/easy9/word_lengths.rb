def word_lengths(string)
  string.split.map{|word| word << " #{word.length}"}
end

p word_lengths("LaBamba Macarena Despacito")