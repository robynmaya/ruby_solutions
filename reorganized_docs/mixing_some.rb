# 3 methods to compare : #zip, #product, #transpose

# We are going to work with mostly these two arrays for examples :

a = [ 1, 2, 3 ]
b = [ 4, 5]

# zip
# (put the same indexed elements into its own array,
# put nil for any spot that is empty)

p ["apple", "banana", "chai"].zip(a, b)   #=> [["apple", 1, 4], ["banana", 2, 5], ["chai", 3, nil]]

# transpose
# (put the same indexed elements into its own array,
# return error if there is any empty slot)

c = [[1,2], [3,4], [5,6]]
p c.transpose               #=> [[1, 3, 5], [2, 4, 6]]

c_imbalanced = [[1,2], [3,4], [5]]
p c_imbalanced.transpose #=> error, element size differs (1 should be 2)

# product
# (see the first array like parents, the second array as the children.
# each parent will be joined by its children - one child in one array at a time)

p a.product(b)    #=> [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]]

=begin
In this case we want to mix multiple arrays.

We have #zip, #product, #transpose methods to produce different patterns of combination.

Similarity :

- All of these methods RETURN A NEW ARRAY.

Differences :

- only #transpose that doesn't take a block

- #zip & #product can take a block, and can also be invoked without a block.

- #transpose require same sized arrays.

- #zip will fill the empty slot in an array with 'nil'.
=end
