NUMBERS = %w( zero one two three four five six seven eight 
              nine ten eleven twelve thirteen fourteen 
              fifteen sixteen seventeen eighteen nineteen)
def alphabetic_number_sort(number_array)
  number_array.sort_by{|key| NUMBERS[key]}
end

p alphabetic_number_sort( [1,12,3,4,5,16,2,4,5,11] )