=begin
Write a method that combines two Arrays passed in as arguments,
and returns a new Array that contains all elements from both Array arguments,
with the elements taken in alternation.
=end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c'] #true
