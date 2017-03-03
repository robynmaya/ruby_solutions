def rotate(array)
  first, *remainder = array
  [*[*remainder],*[first]]
end

#rotate([1,2,3]) => [2,3,1]
