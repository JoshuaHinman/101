def center_of(string)
  length = string.length
  if length.even?
    string[length / 2 - 1, 2]
  else
    string[length / 2]
  end
end

p center_of("Whaddup?")