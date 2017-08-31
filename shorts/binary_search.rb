=begin
Runtime Complexity
Logarithmic, O(logn).

Memory Complexity
Logarithmic, O(logn).
=end

def binary_search_rec(a, key, low, high)
  if low > high
    return -1
  end

  mid = low + ((high - low) / 2)
  if a[mid] == key
    return mid
  elsif key < a[mid]
    return binary_search_rec(a, key, low, mid - 1)
  else
    return binary_search_rec(a, key, mid + 1, high)
  end
end

def binary_search(a, key)
  return binary_search_rec(a, key, 0, a.length - 1)
end

# or

=begin

Runtime Complexity
Logarithmic, O(logn).

Memory Complexity
Constant, O(1).

=end

def binary_search_iterative(a, key)
  low = 0
  high = a.length - 1

  while low <= high
    mid = low + ((high - low) / 2)

    if a[mid] == key
      return mid
    end

    if key < a[mid]
      high = mid - 1
    else
      low = mid + 1
    end
  end

  return -1
end
