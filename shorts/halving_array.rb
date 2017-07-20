=begin
Write a method that takes an Array as an argument,
and returns two Arrays that contain the first half
and second half of the original Array, respectively.
If the original array contains an odd number of elements,
the middle element should be placed in the first half Array.
=end

def halving_array(arr, arr2=[], arr3 = [%w(),%w()])
  case arr.size
  when 0
    arr3
  when 1
    [arr, arr2]
  else
    arr.each_slice((arr.size/2.0).ceil) {|i| arr2.push i}
    arr2
  end
end

p halving_array([1, 2, 3, 4]) == [[1, 2], [3, 4]] # true
p halving_array([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]] # true
p halving_array([5]) == [[5], []] # true
p halving_array([]) == [[], []] # true
