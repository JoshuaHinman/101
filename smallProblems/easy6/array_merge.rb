def array_merge(array1, array2)
  (array1 + array2).uniq
end

p array_merge(%w(1 2 e t 5 H), %w(n m e t F))
