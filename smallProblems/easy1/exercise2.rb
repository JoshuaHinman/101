def odd ( num )
	if num%2 !=0
		return true
	else
		return false
	end
end

def odd2 ( num )
	return num%2 ==1
end

puts odd (-3)
puts odd (7)
puts odd (8)
puts odd2 (-7)
puts odd2 (5)
