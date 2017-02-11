def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s
end

def operation_to_message(operator)
  case operator
  when '1'
    'Adding'
  when '2'
    'Substracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt 'Welcome to Calculator!'

name = ''
loop do
  prompt 'What\'s your name?'
  name = gets.chomp
  name.empty? ? prompt('Use your name') : break
end

prompt "Hi #{name}!"

loop do # main loop
  number1 = ''
  loop do
    prompt 'Gimme the first number'
    number1 = gets.chomp

    valid_number?(number1) ? break : prompt('Invalid number')
  end

  number2 = ''
  loop do
    prompt 'Gimme the second number'
    number2 = gets.chomp

    valid_number?(number2) ? break : prompt('Invalid number')
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) Addition
    2) Substraction
    3) Multiplication
    4) Division
  MSG

  prompt operator_prompt

  operator = ''

  loop do
    operator = gets.chomp

    %w(1 2 3 4).include?(operator) ? break : prompt('Must choose 1, 2, 3, 4')
  end

  prompt "#{operation_to_message operator} the two numbers..."

  result = case operator
           when '1' then number1.to_f + number2.to_f
           when '2' then number1.to_f - number2.to_f
           when '3' then number1.to_f * number2.to_f
           when '4' then number1.to_f / number2.to_f
           end

  prompt "The result is #{result}"
  prompt "Do you want to perform another calculation, #{name}? (Y for Yes)"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt 'Thank you for using the Calculator'
