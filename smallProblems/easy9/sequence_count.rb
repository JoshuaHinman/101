def sequence(count, inc)
  1.upto(count).map{|c| c * inc}
  (1..count).map{|c| c * inc }
end

p sequence(5, 5)
p sequence(7, 2)