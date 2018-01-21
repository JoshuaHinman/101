names = ["Josh" , "Beth" , "Rudy" , "Josh" , "Josh" , "Elsa" , "Beth" , "Josh" , "Beth"]

def count_times(array)
	hash =Hash.new(0)
	array.each do |key|
		if hash.has_key?(key)
			hash[key] +=1
		else
			hash[key] =1
		end

	end
	hash.each do |key,num|
		puts "#{key} => #{num}"
	end
end

def count_times2(array)
	h ={}
	array.each do |k|
    h[k] = array.count(k)
  end

  h.each do |element, count|
    puts "#{element} => #{count}"
  end
end

count_times(names)