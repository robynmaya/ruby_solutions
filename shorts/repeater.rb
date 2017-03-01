#Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(string)
  string.chars.zip(string.chars).join
end

#break down the string into an array of characters, zip it with the same data,
#then combine the content and turn back the array into a string. 
