# Game takes place mainly here. Class includes board updates,
# game end checks, and instantiates Player Class
class Game
  attr_accessor :board

  # include GameLogic
  def initialize(player_one, player_two)
    @board = Array.new(10)
    @players = [player_one.new(self, 'X', 'Player One'),
                player_two.new(self, 'O', 'Player Two')]
    @line = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9],
             [1, 5, 9], [3, 5, 7]]
  end

  # Here, we assign no values, to compare later. #
  def print_board
    (1..9).each_slice(3) do |row|
      puts row.map { |cell| @board[cell] || cell }.join(' | ')
      puts '--+---+--'
    end
  end

  def spot_empty?(cell)
    @board[cell].nil?
  end

  def game_loop
    @current_player = @players.first
    loop do
      print_board
      @current_player.place_token
      if check_win
        print_board
        return puts "#{@current_player.name} outwitted their opponent!"
      end
      if check_tie
        print_board
        return puts 'Both opponents played perfectly, resulting in a tie.'
      end
      @current_player = @players.rotate!.first
    end
  end

  def check_win
    @line.each do |winning_line|
      return true if winning_line.all? { |cell| @board[cell] == @current_player.token }
    end
    false
  end

  def check_tie
    # if no spots == nil, return true, else false
    true unless @board[1..9].include?(nil)
  end
end

# This defines what a player in the game is and what they "own". 
class Player
  def initialize(game_class, token, name)
    @game = game_class
    @token = token
    @name = name
  end
  attr_reader :token, :name
end

# This allows a human player to actually place their token in the Game Class.
class HumanPlayer < Player
  def place_token
    loop do
      print "Choose a valid position(1-9) to place your #{token}:"
      chosen_spot = gets.to_i
      unless @game.spot_empty?(chosen_spot) && (1..9).include?(chosen_spot)
        puts 'Choice is not a valid position. Please try again.'
        next
      end
      @game.board[chosen_spot] = @token
      break
    end
  end
end

test = Game.new(HumanPlayer, HumanPlayer)
test.game_loop
