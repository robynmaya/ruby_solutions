=begin
Write a method that returns a list of all substrings of a string that start at the beginning of the original string.
The return value should be arranged in order from shortest to longest substring.
=end

def substrings_at_start(saywhat)
  saywhat.size <= 1 ? [str] : [substrings_at_start(saywhat.chop), saywhat].flatten
end

#Recursively chopping the last character off and the flatten method turns the multidimensional array into one dimensional array.
