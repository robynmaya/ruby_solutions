def stringy(size)
  numbers = Array.new(size)
  numbers.fill { |i| i.even? ? 1 : 0 }.join
end
