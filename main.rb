require_relative "lib/game"
require_relative "lib/player"
require_relative "lib/human_player"

test = Game.new(HumanPlayer, HumanPlayer)
test.game_loop
