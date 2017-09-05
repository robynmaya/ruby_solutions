=begin
Runtime Complexity
Linear, O(m).

where 'm' is the length of linked list.

Memory Complexity
Constant, O(1).
=end

def adjust_rotations_needed(n, length)
  # If n is positive then number of rotations performed is from right side
  # and if n is negative then number of rotations performed from left side
  # Let's optimize the number of rotations.
  # Handle case if 'n' is a negative number.
  n = n % length

  if (n < 0)
    n = n + length
  end

  return n
end

def rotate_list(head, n)

  if (!head || n == 0)
    return
  end

  # find length of the linked list
  length = get_length(head)

  # Let's optimize the number of rotations.
  # Handle case if 'n' is a negative number.

  # If n (number of rotations required) is bigger than
  # length of linked list or if n is negative then
  # we need to adjust total number of rotations needed
  n = adjust_rotations_needed(n, length)

  if (n == 0)
    return head
  end

  # Find the start of rotated list.
  # If we have 1, 2, 3, 4, 5 where n = 2,
  # 4 is the start of rotated list.
  rotations_count = length - n - 1
  temp = head

  while (rotations_count > 0)
    rotations_count-=1
    temp = temp.next
  end

  # After the above loop temp will be pointing
  # to one node prior to rotation point
  new_head = temp.next

  # Set new end of list.
  temp.next = nil

  # Iterate to the end of list and
  # link that to original head.
  temp = new_head
  while (temp.next)
    temp = temp.next
  end

  temp.next = head

  return new_head
end
