def multisum(high)
  sum = 0
  1.upto(high) do |num|
    if (num % 3 == 0) || (num % 5 == 0)
      sum += num
    end
  end
  sum
end

p multisum 1000
