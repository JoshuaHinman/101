def swap(string)
  out = string.split.map do |word|
    swap = word[0]
    word[0] = word[word.length - 1]
    word[word.length - 1] = swap
    # or word[0], word[-1] = word[-1], word[0]
    word
  end
  out.join(' ')
end

p swap "Hey how's it going?"

