def count_occurrences(array)
  lam = lambda { |k, v| puts "#{k} => #{v.size}"}
  array.group_by { |item| item }.each(&lam) #group_by returns a hash, and then run each on the hash
end
