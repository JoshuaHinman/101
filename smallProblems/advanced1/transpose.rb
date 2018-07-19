matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(matrix)
  new_matrix = Array.new(3) { Array.new(3) }
  (0..2).each do |idx1|
    (0..2).each do |idx2|
      new_matrix[idx1][idx2] = matrix[idx2][idx1]
    end
  end
  new_matrix 
end

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p new_matrix
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
p matrix