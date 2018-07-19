matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]


def rotate90(matrix)
  new_width = matrix.size
  new_height = matrix[0].size
  new_matrix = Array.new(new_height) { Array.new(new_width) }
  (0..new_height -1).each do |idx1|
    (0..new_width -1).each do |idx2|
      new_matrix[idx1][-(idx2+1)] = matrix[idx2][idx1]
    end
  end
  p matrix
  p new_matrix
  new_matrix 
end

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
