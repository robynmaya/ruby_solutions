# Regexes

%r is just like using # to create a regexp object.
# Comes in handy when you're writing a regex containing / as you don't have to continually escape it.
%r{like|this} # => /like|this/
%r{like/this} # => /like\/this/
