=begin
Write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

=end

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end
