def crunch(string)
  new_string = ''
  index = 0 
  loop do
    char = string[index]
    while char = sring[index] && index < string.length - 1
      index += 1
    end
    new_string << char
    break if index == (string.length)
  end
  new_string
end

p crunch('aaaaaaasssssssssrrrrrrrrttttttttiiiinnnnnnggggggg')