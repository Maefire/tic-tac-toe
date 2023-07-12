require_relative "player"
require_relative "human_player"

class TicTacToeGame
  attr_accessor :board, :current_player
  attr_reader :line

  # include GameLogic
  def initialize(player_one, player_two, board = Array.new(10), game_end = false)
    @board = board
    @players = [player_one, player_two]
    @line = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [3, 5, 7]]
    @current_player = @players.first
    @game_end = game_end
  end

  # Here, we assign no values, to compare later. #
  def print_board
    system("clear") || system("clr")
    (1..9).each_slice(3) do |row|
      puts row.map { |cell| board[cell] || cell }.join(" | ")
      puts "--+---+--"
    end
  end

  def game_loop
    loop do
      print_board
      current_player.place_token(self)
      @game_end = game_over?
      break if @game_end
      @current_player = @players.rotate!.first
    end
    handle_game_result(@game_end)
  end

  def game_over?
    return "tie" if tie?
    return "win" if win?

    false
  end

  def win?
    line.each do |winning_line|
      return true if winning_line.all? { |cell| board[cell] == current_player.token }
    end
    false
  end

  def tie?
    return true unless @board[1..9].include?(nil)
    false
  end

  def spot_empty?(cell)
    board[cell].nil?
  end

  def handle_game_result(result)
    case result
    when "win"
      print_board
      puts "#{current_player.name} outwitted their opponent!"
    when "tie"
      print_board
      puts "You both played perfectly, resulting in a tie."
    end
  end
end
