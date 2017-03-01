#Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(string)
  string.chars.zip(string.chars).join
end

#break down the string into an array of characters, zip it with the same data,
#then combine the content and turn back the array into a string.

#####

#Write a method that takes a string, and returns a new string in which every consonant character is doubled.
#Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def double_consonants(string)
  p = lambda { |char| char.match(/[^aeiou\W\d]/i) ? char + char : char }

  string.chars.map(&p).join
end
