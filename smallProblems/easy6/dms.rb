DEGREE = "\xC2\xB0"
def dms (number)
  degrees = number.to_i
  minutes = (number - degrees) * 60.0
  seconds = (minutes - minutes.to_i) * 60.0

  degrees.to_s + DEGREE + minutes.to_s + " " + seconds.to_s
end

loop do
  puts dms(gets.chomp.to_f)  
end