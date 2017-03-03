#Write a method that can rotate the last n digits of a number.

def rotate(arr, n)
  arr.shift(arr.length - n) + arr.pop(n).reverse
end



#rotate([2,3,4,12,33,5], 3) => [2, 3, 4, 5, 33, 12]
