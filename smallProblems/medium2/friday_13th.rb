SECONDS_IN_DAY = 60 * 60 * 24
def friday_13th(year)
  day = Time.new(year)
  year +=1
  fri13_count = 0
  while day.year < year
    fri13_count += 1 if day.friday? && day.day == 13
    day += SECONDS_IN_DAY
  end
  fri13_count
end

loop do
  p  friday_13th(gets.chomp.to_i)
end