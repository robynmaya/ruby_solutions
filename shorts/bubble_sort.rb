=begin
Write a method that takes an Array as an argument,
and sorts that Array using the bubble sort algorithm as just described.
Note that your sort will be "in-place"; that is,
you will mutate the Array passed as an argument.
You may assume that the Array contains at least 2 elements.
=end

def bubble_sort!(arr)
  final_arr = arr.sort
  until arr == final_arr
    1.upto(arr.length-1) do |i|
      arr[i-1], arr[i] = arr[i], arr[i-1] if arr[i-1] >= arr[i]
    end
  end
  arr
end

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array) == ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"] # true
