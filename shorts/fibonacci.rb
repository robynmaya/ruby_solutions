=begin
Create fibonacci method that computes its results without recursion.
=end

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

# another method, shorter but less readability 

def fibonacci2(n)
  (3..n).reduce([1, 1]) { |(a, b), _| [b, a + b] }.last
end
