line = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
# begin Game
class Game
  attr_accessor :board

  # include GameLogic
  def initialize(player_one, player_two)
    @board = Array.new(10)
    @players = [player_one.new(self, "X"), player_two.new(self, "O")]
  end

  # Here, we assign no values, to compare later. #
  def print_board
    (1..9).each_slice(3) do |row|
      puts row.map { |cell| @board[cell] ? @board[cell] : cell }.join(" | ")
      puts  "--+---+--"
    end
  end

  # We check if the value is nil. If not, token can be placed later. #
  def spot_empty?(cell)
    @board[cell].nil?
  end

  def game_loop
    @current_player = @players.first
    loop do
      print_board
      @current_player.place_token
      @current_player = @players.rotate!.first
      return if check_win || check_tie
    end
  end

  def check_win
    # check win here
  end

  def check_tie
    # check tie here. Check if board full? spot_empty?(1..9), return self if all false.
  end
end

# this gives players the X or O tokens, and access to the game class,
# due to above "self" argument
class Player
  def initialize(game_class, token)
    @game = game_class
    @token = token
  end
  attr_reader :token
end

# this class lets player choose token spot, updates board, then switches player?
class HumanPlayer < Player
  def place_token
    loop do
      print "Choose a valid position(1-9) to place your #{token}:"
      chosen_spot = gets.to_i
      unless @game.spot_empty?(chosen_spot) && (1..9).include?(chosen_spot)
        puts "Choice is not a valid position. Please try again."
        next
      end
      @game.board[chosen_spot] = @token
      break
    end
    # DONE ask for input DONE
    # DONE-ish return new board if place is "empty"? DONE-ish
    # DONE if not, error message "Selected spot not valid. Please try again" DONE
  end
end

# Do I need multiple human classes?
test = Game.new(HumanPlayer, HumanPlayer)
test.game_loop
puts "done"