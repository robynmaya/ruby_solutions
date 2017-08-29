=begin
Longest Sentence

Write a program that reads the content of a text file and then prints
the longest sentence in the file based on number of words.
Sentences may end with periods (.), exclamation points (!), or question marks (?).
Any sequence of characters that are not spaces or sentence-ending characters
should be treated as a word. You should also print the number of words in the longest sentence.

=end

text = File.read(file_path)
sentences = text.split(/\.|\?|!/) # split it either by period, question mark or excalamation mark
largest_sentence = sentences.max_by { |sentence| sentence.split.size } # take the longest word based
largest_sentence = largest_sentence.strip # strip the sentence from spaces,
number_of_words = largest_sentence.split.size # so we can tell the number of words more accurately

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"

# second solution

def longest_sentence(file_path)
  text         = File.read(file_path)
  sentences    = text.split(/[.!?]/).map { |sen| [sen.split.size, sen] }.to_h
  max_length   = sentences.keys.max

  puts "The longest sentence in the file has #{max_length} words:"
  puts sentences[max_length].strip
end
