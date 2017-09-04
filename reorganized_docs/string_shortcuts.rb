# Strings

# % and %Q are the same as using double quotes, including string interpolation.
# Really useful when you want to create a string that contains double quotes, but without the hassle of escaping them.
%{}                 # => ""
%Q{}                # => ""

%{hello}            # => "hello"
%{hello #{43}}       # => "hello 42"
%{some "foo" stuff} # => "some \"foo\" stuff"
%q # is equivalent to using single quotes. Behaves exactly the same, no string interpolation.
%q{}           # => ''
%q{hello}      # => "hello"
%q{hello #{42}} # => "hello \#{42}"
