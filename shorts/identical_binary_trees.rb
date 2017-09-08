=begin
Check if two binary trees are identical

Two trees 'A' and 'B' are identical if:

data on their roots is same or both roots are null
left sub-tree of 'A' is identical to the left sub-tree of 'B'
right sub-tree of 'A' is identical to the right sub-tree of 'B'


Solution
Runtime Complexity
Linear, O(n).

Memory Complexity
O(h).
=end

def are_identical(root1, root2)
  if (!root1 && !root2)
    return true
  end

  if (root1 && root2)
    return (root1.data == root2.data &&
    are_identical(root1.left, root2.left) &&
    are_identical(root1.right, root2.right))
  end

  return false
end
