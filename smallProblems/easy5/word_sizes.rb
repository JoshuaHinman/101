def word_sizes(string)
  count = Hash.new(0)
  string.split(' ').each do |word|
    count[word.length] += 1
  end
  count.sort.to_h
end

p word_sizes "This is a long drive for one person"