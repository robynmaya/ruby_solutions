=begin
Write a method that returns a list of all substrings of a string.
The returned list should be ordered by where in the string the substring begins.
This means that all substrings that start at position 0 should come first,
then all substrings that start at position 1, and so on.
Since multiple substrings will occur at each position,
the substrings at a given position should be returned in order from shortest to longest.
=end

def subs(arr2, base=[])
  1.upto(arr2.size).with_object(base) { |x, final_arr| final_arr << arr2.take(x) }.flatten!
end

def subs2(arr)
  final_arr = []
  arr.size.times do |i|
    arr2 = arr.drop(i)
    subs(arr2, final_arr)
  end
  final_arr
end

=begin
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
=end
