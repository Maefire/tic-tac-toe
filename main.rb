require_relative "lib/tic_tac_toe_game"
require_relative "lib/player"
require_relative "lib/human_player"

player_one = HumanPlayer.new(self, "X", "Player One")
player_two = HumanPlayer.new(self, "O", "Player Two")
test = TicTacToeGame.new(player_one, player_two)
test.game_loop
