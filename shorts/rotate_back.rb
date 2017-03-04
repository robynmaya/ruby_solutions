#Write a method that can rotate the last n digits of a number.
#rotate an array
def rotate(arr, n)
  arr.shift(arr.length - n) + arr.pop(n).reverse
end

#rotate([2,3,4,12,33,5], 3) => [2, 3, 4, 5, 33, 12]
###
#rotate integers
def rotate(number, n)
  arr = number.to_s.split('').map(&:to_i)
  arr.shift(arr.length - n).push(arr.pop(n).reverse).join.to_i
end

#rotate(234544526, 3)  => 234544625
