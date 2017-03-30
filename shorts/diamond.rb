#Print the outline of a diamond

def diamond(number, str="")
  (1..number-1).step(2) {|j|
    str = " " * j
    str[0] = "x"
    str[-1] = "x"
    puts str.center(number)
  }
  number.downto(1) {|j|
    str = " " * j
    str[0] = "x"
    str[-1] = "x"
    puts str.center(number) if j.odd?
  }
end

#Print a diamond
def diamond(number)
  (1..number-1).step(2) {|j|
    puts ("x" * j).center(number)
  }
  number.downto(1) {|j|
    puts ("x" * j).center(number) if j.odd?
  }
end
