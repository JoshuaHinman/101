def diamonds(num)
  (1..num).each do |stars|
    puts ("*" * stars).center(num) if stars % 2 !=0
  end
  (-(num-2)..-1).step(2) do |stars|
    puts ("*" * -stars).center(num) if -stars % 2 !=0
  end
end

loop do
  diamonds gets.chomp.to_i
end