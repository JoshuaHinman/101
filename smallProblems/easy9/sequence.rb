def sequence(number)
  rng = (0..1)
  number < 0 ? rng = (number..-1) : rng = (1..number)
  rng.to_a
end
loop do
  p sequence(gets.chomp.to_i)
end
