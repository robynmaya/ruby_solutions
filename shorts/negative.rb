=begin
Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.
=end

def negative(number)
  number < 0 ? number : number*-1
end
