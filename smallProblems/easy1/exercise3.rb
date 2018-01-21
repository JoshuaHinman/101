def number_split ( number)
	number.to_s.split(//).map { |x| x.to_i }

end

puts number_split 467899

