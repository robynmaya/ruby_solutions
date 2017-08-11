class Player
  attr_accessor :name, :cards, :state

  def initialize(name, cards, state)
    @name = name
    @cards = cards
    @state = state
  end

  def is_stayed?
    @state == :stay
  end

  def is_busted?
    @state == :bust
  end

  def is_hitting?
    @state == :hit
  end

  def hit(deck)
    @state = :hit
    self.take_card(deck)
  end

  def stay
    @state = :stay
  end

  def bust
    @state = :bust
  end

  def take_card(deck)
    @cards << deck.deal_card
  end

  def total
    value = @cards.map do |card|
      if card == "Ace"
        card = 11
      elsif card.to_s.size >= 3
        card = 10
      else
        card
      end
    end #end of mapping

    if @cards.count("Ace") > 1
      value.inject(&:+) - 10
    else
      value.inject(&:+)
    end
  end # end of total

  def print_summary
    states = {
      stay: "You chose to stay",
      bust: "You busted",
      hit: "You chose to hit",
      initial: "This is your first turn"
    }
    puts "#{states[@state]}, #{@name}. Your cards are #{@cards}, and their value is #{self.total}"
  end

end # end of Player class

class Deck
  def initialize
    @deck = ((2..10).to_a.push("Jack", "Queen", "King", "Ace").shuffle) * 4
  end

  def deal_card()
    @deck.delete_at(@deck.find_index(@deck.sample)) # draw a card
  end
end

def print_line
  puts "----------------------------------"
end

def print_result(players)
  puts "","######### DRUM ROLL #########",""
  if players[0].is_stayed? && players[1].is_busted?
    puts "#{players[0].name} wins!"
  elsif players[1].is_stayed? && players[0].is_busted?
    puts "#{players[1].name} wins!"
  elsif players[0].is_stayed? && players[1].is_stayed?
    puts "#{players[1].name} wins!" if players[0].total > players[1].total
    puts "#{players[2].name} wins!" if players[1].total > players[0].total
  elsif players[0].is_busted? && players[1].is_busted?
    puts "You both busted. No one wins."
  elsif players[0].total == players[1].total
    puts "It's a tie!"
  end
end

def blackjack()

  # prepare the cards

  deck = Deck.new
  players = []

  puts "Welcome to blackjack!"
  print_line

  1.upto(2) do |i|
    players << Player.new("Player #{i}", [], :initial)

    # dispense two cards for each player
    2.times do | card |
      players[i-1].take_card(deck)
    end
  end

  players.map do |current_player|
    puts "What's your name, #{current_player.name}?"
    current_player.name = gets.chomp
    print_line
  end

  players.shuffle!

  loop do
    players.each do |current_player|

      current_player.print_summary
      loop do
        puts "Would you like to 'hit' or 'stay', #{current_player.name}?"
        print_line
        action = gets.chomp.downcase
        print_line

        case action
        when 'hit'
          current_player.hit(deck)
          current_player.print_summary

          if current_player.total > 21
            puts "You busted at #{current_player.total}, #{current_player.name}!"
            print_line
            current_player.bust
            break
          end

        when 'stay'
          current_player.stay
          current_player.print_summary
          print_line
          break
        else
          puts "Invalid input. Please enter 'hit' or 'stay'!"
        end
      end # end of inner loop

      next
    end # end of players loop that iterates over players array

    break
  end # end of loop

  print_result(players)
end

blackjack()
