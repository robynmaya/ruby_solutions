=begin
Write a method that takes a string, and then returns a hash
that contains 3 entries: one represents the percentage of characters in
the string that are lowercase letters, one the percentage of characters
that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

example :

letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

=end


# using Hash#transform_values (only works in Ruby 2.4+):
def letter_percentages(str)
  hsh = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }
  hsh.transform_values { |pattern| str.count(pattern).fdiv(str.size) * 100 }
end
