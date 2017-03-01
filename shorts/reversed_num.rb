# Convert number to reversed array of digits

def reversed_num(number)
  lam = lambda { |x| x.to_i > 0 }
  number.to_s.chars.find_all(&lam).reverse.map(&:to_i).join.to_i
end

#turn the number into a string
#turn the string into an array of characters
#find_all through the lambda, takes out only number that is greater than 0
#find_all returns an array
#the new array is then reversed
#using map, we turn every string in the reversed array into an integer
#turn the array into a string
#then at last, turn the string into integers...... god dang.
