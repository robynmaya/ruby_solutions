#Write a method that can rotate the last n digits of a number.
#rotate an array
def rotate(arr, n)
  arr.shift(arr.length - n) + arr.pop(n).reverse
end

#rotate([2,3,4,12,33,5], 3) => [2, 3, 4, 5, 33, 12]

###

#rotate rightmost integers
def rotate_rightmost_digits(number, n)
  arr = number.to_s.chars
  arr2 = arr.pop(n)
  arr << arr2.drop(1).push(arr2[0])
  arr.join.to_i
end

=begin
sample tests
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
=end

def max_rotation(number)
  number.to_s.length.downto(1) do |i|
    number = rotate_rightmost_digits(number, i)
  end
  number
end
=begin
sample tests
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
=end
