def halvsies(array)
  arr1 = []
  arr2 = []
  array.each_with_index do |val, idx|
    if idx <= array.length / 2
      arr1 << val
    else
      arr2 << val
    end
  end
  return arr1, arr2
end

p halvsies(%w(1 2 3 4 5 6 7 8 9))