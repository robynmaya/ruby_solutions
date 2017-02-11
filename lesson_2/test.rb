def test_method
  prompt('test message')
end

test_method

def prompt(message)
  puts "=> #{message}"
end
