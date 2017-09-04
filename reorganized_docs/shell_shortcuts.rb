# Shelling out

%x  # is the same as backticks (``), executes the command in a shell and returns the output as a string.
#And just like backticks it supports string interpolation.

`echo hi`     # => "hi\n"
%x{echo hi}   # => "hi\n"
%x{echo #{42}} # => "42\n"
