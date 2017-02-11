VALID_CHOICES = %w(rock paper scissors).freeze

# Score keeps the computer and player's score
class Score
  class <<self
    attr_accessor :player, :computer
  end
  @player = 0
  @computer = 0
end

def output(message)
  puts "=> #{message}"
end

def rock?(str)
  str == 'rock' || str == 'r'
end

def scissors?(str)
  str == 'scissors' || str == 's'
end

def paper?(str)
  str == 'paper' || str == 'p'
end

def player_won(player, computer)
  (rock?(player) && scissors?(computer)) ||
    (paper?(player) && rock?(computer)) ||
    (scissors?(player) && paper?(computer))
end

def computer_won(player, computer)
  (rock?(player) && paper?(computer)) ||
    (paper?(player) && scissors?(computer)) ||
    (scissors?(player) && rock?(computer))
end

def display_result(player, computer)
  if player_won(player, computer)
    'You get a point!'
  elsif computer_won(player, computer)
    'Computer gets a point!'
  else
    'It\'s a tie - you both get a point!'
  end
end

def score(player, computer)
  if player_won(player, computer)
    Score.player += 1
  elsif computer_won(player, computer)
    Score.computer += 1
  else
    Score.player += 1
    Score.computer += 1
  end
end

def final_score?
  if Score.player == 5 && Score.computer == 5
    output 'Game Over. It\'s a tie'
    true
  elsif Score.player == 5
    output 'Player wins.'
    true
  elsif Score.computer == 5
    output 'Computer wins.'
    true
  else
    false
  end
end

def choice_parse(input)
  return 'rock' if rock? input
  return 'paper' if paper? input
  return 'scissors' if scissors? input
end

loop do
  loop do
    choice = ''
    loop do
      output "Choose one: #{VALID_CHOICES.join(', ')}"
      choice = choice_parse gets.chomp

      break unless choice.nil?

      output('Invalid choice')
    end

    computer_choice = VALID_CHOICES.sample

    output "You chose: #{choice}; Computer chose: #{computer_choice}"

    output display_result(choice, computer_choice)

    score(choice, computer_choice) # increments scores

    break if final_score? # checks for an ultimate winner
  end

  output 'Do you want to play again?'
  break unless gets.chomp.downcase.start_with?('y')
end

output 'Thank you for playing Rock Scissors and Paper'
