NUMBERS = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
            'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'}

def word_to_digit(string)
  string = string.split
  string.each_with_index do |word, idx|
    NUMBERS.each { |key, num| string[idx] = num if key == word}
  end
  string.join(' ')
end

def word_to_digit_2(string)
  NUMBERS.keys.each do |word|
    string.gsub!(/\b#{word}\b/, NUMBERS[word])
  end
  string
end
loop  do
  p word_to_digit_2(gets.chomp)
end