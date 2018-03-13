def cleanup(string)
  string.gsub(/[^a-z]/i, ' ').squeeze(' ')

end

p cleanup "H*..ello W!!orld"