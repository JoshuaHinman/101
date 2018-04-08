def triangle(a1, a2, a3)
  arr = [a1, a2, a3]
    if arr.sum != 180 || arr.include?(0)
      :invalid 
    elsif arr.include?(90)
      :right
    elsif arr.any?{|a| a > 90}
      :obtuse
    elsif arr.all?{|a| a < 90}
      :acute
    end
end

p triangle( 60, 60, 60)