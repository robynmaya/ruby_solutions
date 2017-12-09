# Fibonacci method without recursion

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

# another method with reduce, shorter but less readability

def fibonacci2(n)
  (3..n).reduce([1, 1]) { |(a, b), _| [b, a + b] }.last
end

fibonacci_array = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55];

# run the code and store the result

result = [];
result2 = [];

0.upto(10) do |x|

  if x == 0
    result.push(0)
    result2.push(0)
  else
    result.push(fibonacci(x))
    result2.push(fibonacci2(x))
  end

end

# here comes the tests

test = []; # fibonacci1
test2 = []; # fibonacci2

0.upto(10) do |x|
   puts "fibonacci1(#{x}) is #{result[x]} ", result[x] == fibonacci_array[x], " ";

   puts "fibonacci2(#{x}) is #{result2[x]} ", result2[x] == fibonacci_array[x], " ";

   test.push(result[x] == fibonacci_array[x]);
   test2.push(result[x] == fibonacci_array[x]);

end

print "So, is everything true according to the first fibonacci code? Yes, it is all ", test.all? {|x| x == true }, "\n"
print "How about, the second fibonacci code? Yes, it is also ", test2.all? {|x| x == true }

=begin
Program ran and following lines will be printed on to the console:

fibonacci1(0) is 0
true

fibonacci2(0) is 0
true

fibonacci1(1) is 1
true

fibonacci2(1) is 1
true

fibonacci1(2) is 1
true

fibonacci2(2) is 1
true

fibonacci1(3) is 2
true

fibonacci2(3) is 2
true

fibonacci1(4) is 3
true

fibonacci2(4) is 3
true

fibonacci1(5) is 5
true

fibonacci2(5) is 5
true

fibonacci1(6) is 8
true

fibonacci2(6) is 8
true

fibonacci1(7) is 13
true

fibonacci2(7) is 13
true

fibonacci1(8) is 21
true

fibonacci2(8) is 21
true

fibonacci1(9) is 34
true

fibonacci2(9) is 34
true

fibonacci1(10) is 55
true

fibonacci2(10) is 55
true

So, is everything true according to the first fibonacci code? Yes, it is all true
How about, the second fibonacci code? Yes, it is also true

=end
