=begin

Matching Parentheses?

Write a method that takes a string as argument,
and returns true if all parentheses in the string are properly balanced,
false otherwise. To be properly balanced, parentheses must occur in
matching '(' and ')' pairs.

=end

def balanced?(str)
  str.count('(') == str.count(')') && str.scan(/[\(\)]/).last != '('
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
