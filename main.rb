line = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
# begin Game
class Game
  # include GameLogic
  def initialize(player_one, player_two)
    @board = Array.new(10)
    @players = [player_one.new(self, "X"), player_two.new(self, "O")]
  end

  def print_board
    puts "#{@board[1] = 1} | #{@board[2] = 2} | #{@board[3] = 3}"
    puts "--+---+--"
    puts "#{@board[4] = 4} | #{@board[5] = 5} | #{@board[6] = 6}"
    puts "--+---+--"
    puts "#{@board[7] = 7} | #{@board[8] = 8} | #{@board[9] = 9}"
  end

  def game_loop
    loop do
      print_board
      return
    end
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
    # ask for input
    # return new board if place is "empty"?
    # switch player?
    # if not, error message "Selected spot not valid. Please try again"
  end
end

# Do I need multiple human classes?
test = Game.new(HumanPlayer, HumanPlayer)
test.game_loop
puts "done"