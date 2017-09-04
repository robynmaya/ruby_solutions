# Arrays

# Using splat (*) like so : *abrakadabra => ["abrakadabra"]

%w # is the equivalent of using String#split.
# It takes a string and splits it on whitespace. With the added bonus of being able to escape whitespace too.
%W # has extra power, which allows string interpolation.

%w(abra kada bra)  # => ["abra", "kada", "bra"]
%w(abra\ kada bra) # => ["abra kada", "bra"]
%W(abra #{42} kadabra) # => ["abra", "42", "kadabra"]
