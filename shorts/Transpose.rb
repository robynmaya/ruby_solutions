=begin
Write a method that takes a 3 x 3 matrix in Array of Arrays format
and returns the transpose of the original matrix. Do not use #transpose method

example :

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

=end

def transpose(matrix)
  arr1, arr2, arr3 = [], [], []
  matrix.each do |arr|
    arr1 << arr[0]
    arr2 << arr[1]
    arr3 << arr[2]
  end
  result = []
  result << arr1 << arr2 << arr3
end

# or ...

# works for any size square or rectangular matrix:
def transpose(matrix)
  matrix.first.zip(*matrix.drop(1))
end
