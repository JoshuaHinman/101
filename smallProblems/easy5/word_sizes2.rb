def word_sizes(string)
  count = Hash.new(0)
  string.split(' ').each do |word|
    clean = word.delete('^A-Za-z')
    count[clean.length] += 1
  end
  count.sort.to_h
end

p word_sizes "It's a long drive for one person!"