# Symbols

%s  # creates a symbol, just like writing :foo manually. 
# It takes care of escaping the symbol, but unlike :"" it doesn't allow string interpolation however.

%s{omg}      # => :omg
%s{omg/hello}  # => :"omg/hello"
:"omg-#{42}"  # => :"omg-42"
%s{omg-#{42}} # => :"omg-\#{42}"
