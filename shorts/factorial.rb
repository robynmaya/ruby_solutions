=begin
In mathematics, factorials are special numbers.
They are usually written as a positive integer followed by an exclamation point
, e.g., `5!` (which is read as "five factorial").  `5!` can be computed as:


5! -> 5 * 4 * 3 * 2 * 1 -> 120


Simililarly, `10!` is `10  9  8  7  6  5  4  3  2 *1`, or `3628800`.

Write a method that computes the factorial value for
some arbitrary positive integer, and returns the sum of all of the digits
in that number. For this exercise, do not use reduce or inject.

Examples:


factorial_sum(4) == 6     # (4! -> 24 -> 2 + 4 -> 6)
factorial_sum(10) == 27   # (10! -> 3628800 -> 3+6+2+8+8+0+0 -> 27)
factorial_sum(50) == 216
factorial_sum(100) == 648
=end

def factorial(number)
  result = 1
  number.downto(1) do |i|
    result *= i
  end
  result
end

factorial(5)
