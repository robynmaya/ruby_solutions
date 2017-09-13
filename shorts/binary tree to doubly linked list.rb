=begin
Convert a binary tree to a doubly linked list such that the order of the doubly
linked list is the same as an in-order traversal of the binary tree.
After conversion the left pointer of the node should be pointing to the previous
node in the doubly linked list and the right pointer should be pointing to the next
node in the doubly linked list.

Runtime Complexity
Linear, O(n).

Runtime complexity is based on the number of nodes in the tree.

Memory Complexity
Linear, O(h).

Recursive solution has O(h) memory complexity as it will consume memory on
the stack up to the height of binary tree 'h'. It will be O(log n) for balanced
tree and in worst case can be O(n).

In an in-order traversal, first the left sub-tree is traversed then the root
is visited and finally the right sub-tree is traversed.

One simple way of solving this problem is to start with an empty doubly linked list.
While doing the in-order traversal of the binary tree, keep inserting each element
output into the doubly linked list. But if we look at the question carefully,
the interviewer wants us to convert the binary tree to a doubly linked list
in-place i.e. we should not create new nodes for the doubly linked list.


=end

# merge(fuse) two sorted linked lists

def concatenate_lists(head1, head2)
  if (!head1)
    return head2
  end

  if (!head2)
    return head1
  end

  # use left for previous.
  # use right for next.
  tail1 = head1.left
  tail2 = head2.left

  tail1.right = head2
  head2.left = tail1

  head1.left = tail2
  tail2.right = head1

  return head1
end

def convert_to_linked_list(root)
  if (!root)
    return nil
  end

  list1 = convert_to_linked_list(root.left)
  list2 = convert_to_linked_list(root.right)

  root.left = root.right = root
  result = concatenate_lists(list1, root)
  result = concatenate_lists(result, list2)

  return result
end
