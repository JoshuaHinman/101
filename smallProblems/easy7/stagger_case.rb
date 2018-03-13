def stagger_case(string)
  uppercase = true
  output = ''
  string.chars.each do |ch|
    if ch=~ /[a-zA-Z]/
      if uppercase == true
        output << ch.upcase
        uppercase = false
      else
        output << ch.downcase
        uppercase = true
      end
    else
      output << ch
    end
  end
  output
end

p stagger_case "This is a test!"