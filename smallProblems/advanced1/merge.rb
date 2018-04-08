def merge(array1, array2)
  arr2_count = 0
  output = []
  array1.each do |val1|
    while array2[arr2_count] < val1 && !array2.empty?
      output << array2[arr2_count]
      arr2_count += 1
    end
    output << val1
  end
  (output << array2.slice(arr2_count..-1)).flatten 
end

p arr1 = [1,3,5,7,9]
p arr2 = [2,4,6,8,10,11,12]
p merge(arr1, arr2)

p arr1
p arr2