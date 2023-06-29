require_relative "lib/tic_tac_toe_game"
require_relative "lib/player"
require_relative "lib/human_player"

test = TicTacToeGame.new(HumanPlayer, HumanPlayer)
test.game_loop
