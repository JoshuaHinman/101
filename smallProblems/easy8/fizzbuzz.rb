def fizzbuzz(start, finish)
  output = ''
  (start..finish).each do |x|
    if x % 3 == 0 && x % 5 == 0
      output << 'fizzbuzz, '
    elsif x % 3 == 0
      output << 'fizz, '
    elsif x % 5 == 0
      output << 'buzz, '
    else
      output << "#{x}, "
    end
  end
  output
end

p fizzbuzz(1, 30)