#Print numbers, or Fizz if the number is divisible by 3, Buzz if divisible by 5
def fizzbuzz(first, last, result=[])
  first.upto(last) do |i|
    if i % 3 == 0
      result << "fizz"
    elsif i % 5 == 0
      result << "buzz"
    else
      result << i.to_s
    end
  end
  puts result.join(', ')
end
