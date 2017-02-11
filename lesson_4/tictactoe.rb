require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]].freeze       # diagonals

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

# using a hash with keys 1-9 as the board
def display_board(brd)
  puts "You're an #{PLAYER_MARKER} and Computer is an #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board # this method returns a hash contains 9 items
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  # returns an array of the keys that are still empty
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def join_or(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}" # mutate the last element to be appended by 'or'
    arr.join(delimiter) # join all elements with , delimiter
  end
end

def player_places_piece!(brd)
  chosen_square = ''
  loop do
    prompt "Choose a position to place a piece: #{join_or(empty_squares(brd), ', ')}"
    chosen_square = gets.chomp.to_i
    # break if the player selects an empty square
    # the chosen square is available
    break if empty_squares(brd).include?(chosen_square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[chosen_square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  # defense first
  # when the player has placed 2 pieces / took 2 turns
  WINNING_LINES.each do |line|
    # line is a 3 elements array from the Board hash that contains 9 lines
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    # computer found the empty square that lines up with the 2 squares taken by the player
    break if square
  end

  # offense
  if !square # if only runs when the condition is true, that means with ! - square has to be nil
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  # Just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board, marker) # returns one integer or nil
  # below, the splat * on line variable, converts the line which is an array of 3 elements into a comma-separated list.
  # values_at only accepts a comma-separated list - not an array.
  if board.values_at(*line).count(marker) == 2 # if 2 values are taken by the player
    # keys method returns an array contains a single integer, first method pulls out the integer out of the array
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # convert nil into false, and a string into true
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3 # result : TRUE
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3 # result : TRUE
      return 'Computer'
    end
  end
  nil
end

def play_round(board)
  loop do # taking turns for player and computer
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)
end

def update_score(p_score, c_score, board)
  if someone_won?(board)
    case detect_winner(board)
    when 'Player' then p_score += 1
    when 'Computer' then c_score += 1
    end
    prompt "#{detect_winner(board)} won! (player: #{p_score}, computer: #{c_score})"
  else
    prompt "It's a tie!"
  end
  prompt 'Press any key'
  gets
  [p_score, c_score]
end

loop do # the beginning of the game
  p_score = 0
  c_score = 0

  loop do
    board = initialize_board # assign the hash into the board variable
    play_round(board)
    p_score, c_score = update_score(p_score, c_score, board)
    if p_score == 5
      prompt "Congratulations, you won!"
    end
    break if p_score == 5 || c_score == 5
  end

  prompt "Play again? (Y for 'Yes', N for 'No')"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end


prompt "Thank you for playing Tic Tac Toe. Good bye!"
