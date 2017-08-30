=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

Examples

star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

=end

def star(size)
  spaces = (size / 2).floor - 1
  top = []

  spaces.downto(0).each do |s|
    str = '*' + " "*s + '*' + " "*s + '*'
    top << str.center(size)
  end

  puts top + ['*'*size] + top.reverse
end

# or ...

def star(num)
  lines = (0...num / 2).map { |n| "#{('*' + ' ' * n) * 2}*".center(num) }
  puts [lines.reverse, '*' * num, lines]
end

# or ...

def star(n)
  puts (-(n / 2)..n / 2).map { |d| d.zero? ? '*' * n : "#{('*' + ' ' * (d.abs - 1)) * 2}*".center(n) }
end
