# Convert number to reversed array of digits

def reversed_num(number)
   number.to_s.chars.find_all{ |x| x.to_i > 0 }.reverse.map(&:to_i)
end

#turn the number into a string
#turn the string into an array of characters
#find_all takes out only number that is greater than 0
#find_all returns an array
#the new array is then reversed
#finally -using map- we turn every string in the reversed array into an integer
