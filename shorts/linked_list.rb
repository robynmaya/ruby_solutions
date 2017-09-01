=begin

Runtime Complexity
Linear, O(n).

As we can reverse the linked list in a single pass.

Memory Complexity
Constant, O(1).

=end

def reverse_iterative(head)
  # no need to reverse if head is nil
  # or there is only 1 node.
  if (!head || !head.next)
    return head
  end

  current_head = head.next
  reversed_head = head
  reversed_head.next = nil

  while (current_head)
    temp = current_head
    current_head = current_head.next

    temp.next = reversed_head
    reversed_head = temp
  end

  return reversed_head
end

# or ...
=begin

Runtime Complexity
Linear, O(n).

Memory Complexity
Linear, O(n).

=end

def reverse_recursive(head)
  # no need to reverse if head is nil
  # or there is only 1 node.
  if (!head || !head.next)
    return head
  end

  reversed_head = reverse_recursive(
  head.next)

  head.next.next = head
  head.next = nil
  return reversed_head
end
