def prompt(message)
  puts "=> #{message}"
end

name = ''
amount = ''
interest_rate = ''
years = ''

loop do
  prompt 'Welcome to Mortgage Calculator!'
  prompt '-------------------------------'

  loop do
    prompt 'What\'s your name?'
    name = gets.chomp
    name.empty? ? prompt('Use your name') : break
  end

  prompt "What is the loan amount, #{name}?"

  positive = 'Must enter positive number.'

  loop do
    amount = gets.chomp
    amount.empty? || amount.to_f < 0 ? prompt(positive) : break
  end

  prompt 'What is the interest rate?'
  prompt '(Example: 5 for 5% or 2.5 for 2.5%)'

  loop do
    interest_rate = gets.chomp
    interest_rate.empty? || interest_rate.to_f < 0 ? prompt(positive) : break
  end

  prompt 'What is the loan duration (in years)?'

  loop do
    years = gets.chomp
    years.empty? || years.to_i <= 0 ? prompt('Enter a valid number') : break
  end

  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i * 12

  monthly_payment = amount.to_f *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-months.to_i))

  prompt "Your monthly payment is: $#{format('%.2f', monthly_payment)}"

  prompt "Another calculation, #{name}?"
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt 'Thank you for using the Mortgage Calculator!'
prompt 'Good bye!'
