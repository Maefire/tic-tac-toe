require_relative "player"
require_relative "human_player"

class TicTacToeGame
  attr_accessor :board, :current_player
  attr_reader :line

  # include GameLogic
  def initialize(player_one, player_two, board = Array.new(10))
    @board = board
    @players = [player_one, player_two]
    @line = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [3, 5, 7]]
    @current_player = @players.first
  end

  # Here, we assign no values, to compare later. #
  def print_board
    (1..9).each_slice(3) do |row|
      puts row.map { |cell| board[cell] || cell }.join(" | ")
      puts "--+---+--"
    end
  end

  def game_loop
    loop do
      system("clear") || system("clr")
      print_board
      current_player.place_token(self)
      break if game_over?
      @current_player = @players.rotate!.first
    end
  end

  def game_over?
    system("clear") || system("clr")
    print_board
    return true if tie? || win?
    false
  end

  def win?
    puts "#{current_player.name} outwitted their opponent!"
    line.each do |winning_line|
      return true if winning_line.all? { |cell| board[cell] == current_player.token }
    end
    false
  end

  def tie?
    return false if @board[1..9].include?(nil)
    puts "You both played perfectly, resulting in a tie."
    true
  end

  def spot_empty?(cell)
    board[cell].nil?
  end
end
