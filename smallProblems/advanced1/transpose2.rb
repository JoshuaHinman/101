matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(matrix)
  new_width = matrix.size
  new_height = matrix[0].size
  new_matrix = Array.new(new_height) { Array.new(new_width) }
  (0..new_height -1).each do |idx1|
    (0..new_width -1).each do |idx2|
      new_matrix[idx1][idx2] = matrix[idx2][idx1]
    end
  end
  p matrix
  p new_matrix
  new_matrix 
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]