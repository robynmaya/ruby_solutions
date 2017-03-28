=begin
Write a method that returns a list of all substrings of a string.
=end

def subs(str, base=[]) #method 1
  arr2 = str.chars
  1.upto(arr2.size).with_object(base) { |x, final_arr| final_arr << arr2.take(x) }.map(&:join)
end

=begin
For the next method the output is below:
subs2('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
=end

def subs2(str, final_arr=[])
  arr = str.chars
  arr.size.times do |i|
    str = arr.drop(i).join
    subs(str, final_arr) #use the previous method 1
  end
  final_arr.map(&:join)
end

#find palindromes among the substrings
def sub3_palindrome(string, result=[])
  substrings = subs2(string) #use the previous method 2
  palindrome = lambda { |substring| substring == substring.reverse if substring.length > 1 }
  (result << substrings.select(&palindrome)).flatten
end
