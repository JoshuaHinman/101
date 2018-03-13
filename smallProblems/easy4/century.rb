ENDINGS = ['th', 'st', 'nd', 'rd', 'th', 'th', 'th', 'th', 'th']

def century(year)
  result = (year + 99) / 100
  ending = ENDINGS[result % 10]
  result.to_s + ending
end
loop do
  puts century(gets.chomp.to_i)
end