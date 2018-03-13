def after_midnight(num)
  hour = 0
  if num < 0
    hour, minutes = num.abs.divmod(60)
    minutes = 60 - minutes
    hour = 23 - (hour % 24)
  else
    hour, minutes = num.divmod(60)
    hour = (hour % 24)
  end
  format('%02d:%02d', hour, minutes)
end

loop do
  p after_midnight(gets.chomp.to_i)
end