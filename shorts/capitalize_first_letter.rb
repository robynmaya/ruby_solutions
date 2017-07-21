=begin
Write a method that takes a single String argument and returns a new string
that contains the original value of the argument with the first character
of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.
=end


def word_cap(string)
  string.split.map{|i| i[0].upcase!+i[1..-1]}.join(' ')
end

word_cap('four score and seven') == 'Four Score And Seven' #true
