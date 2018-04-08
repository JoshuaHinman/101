def triangle(s1, s2, s3)
  arr = [s1, s2, s3].sort
    if arr[0] + arr[1] <= arr[2] || arr.include?(0)
      :invalid 
    elsif arr.uniq.length == 1
      :equilateral 
    elsif arr.uniq.length == 2
      :isosceles
    else
      :scalene
    end
end

p triangle( 4, 4, 4)