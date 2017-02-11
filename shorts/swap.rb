=begin
Given a string of words separated by spaces, write a method that takes this string of words
and returns a string in which the first and last letters of every word is swapped.

You may assume that every word contains at least one letter,
and that the string will always contain at least one word.
You may also assume that each string contains nothing but words and spaces
=end

def swap(string)
  p = proc { |w| w[0], w[-1] = w[-1], w[0] }
  string.split.each(&p).join(" ")
end
