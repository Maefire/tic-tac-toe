# require_relative "./player"
# require_relative "./human_player"

class Game
  attr_accessor :board, :current_player
  attr_reader :line

  # include GameLogic
  def initialize(player_one, player_two)
    @board = Array.new(10)
    @players = [player_one.new(self, "X", get_name),
      player_two.new(self, "O", get_name)]
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
      current_player.place_token
      if check_win
        print_board
        return puts "#{current_player.name} outwitted their opponent!"
      end
      if check_tie
        print_board
        return puts "Both opponents played perfectly, resulting in a tie."
      end
      @current_player = @players.rotate!.first
    end
  end

  def check_win
    line.each do |winning_line|
      return true if winning_line.all? { |cell| board[cell] == current_player.token }
    end
    false
  end

  def check_tie
    # if no spots == nil, return true, else false
    true unless @board[1..9].include?(nil)
  end

  def spot_empty?(cell)
    board[cell].nil?
  end

  def get_name
    puts "Please insert your name:"
    gets.chomp
  end
end
