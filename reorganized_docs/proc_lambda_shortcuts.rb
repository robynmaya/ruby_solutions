#reduce == #inject (so you won't have to write a block)

# Find sum of some numbers
(5..10).reduce(:+)                             #=> 45

# Same using a block and inject
(5..10).inject { |sum, n| sum + n }            #=> 45

# Multiply some numbers
(5..10).reduce(1, :*)                          #=> 151200

# Same using a block
(5..10).inject(1) { |product, n| product * n } #=> 151200
# find the longest word

# Lambda has a shortcut too!

# -> is called stabby lambda or lambda literal
stabby = ->(x){ x + 1 }
# it is the same like writing a lambda like below
just_lambda  = lambda { |x| x + 1 }

# Another cool shortcut, unknown to many :

array.each(&method(:foo)) == array.each { |element| foo(element) }

# shortcut calling an object that has a to_proc method

arr = [1, 2, 3]
arr_str = ["aa", "bb", "cc"]

arr2 = arr.map(&:to_s) # turn each item into string => ["1", "2", "3"]
arr2.map(&:to_i) # turn it back to [1, 2, 3]
arr.map(&:to_f) # turn each item into float => [1.0, 2.0, 3.0]

arr_str.map(&:to_sym) # == (&:intern) => [:aa, :bb, :cc]
arr_str.map(&:capitalize) # => ["Aa", "Bb", "Cc"]

arr_str2 = arr_str.map(&:upcase) # => ["AA", "BB", "CC"]
arr_str2.map(&:downcase) # turning back into lowercase => ["aa", "bb", "cc"]
