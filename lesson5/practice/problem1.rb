arr = ['5', '8', '2', '11', '7', '1']

arr.sort! { |a,b| b.to_i <=> a.to_i}

p arr