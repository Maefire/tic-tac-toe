require_relative "../lib/tic_tac_toe_game"
require_relative "../lib/player"
require_relative "../lib/human_player"

describe TicTacToeGame do
  # let(:player_one) { HumanPlayer.new(self, "X", "Mark") }
  # let(:player_two) { HumanPlayer.new(self, "O", "Mary") }
  let(:game) { described_class.new(player_one, player_two) }
  let(:player_one) { instance_double("HumanPlayer", token: "X", name: "Mark") }
  let(:player_two) { instance_double("HumanPlayer", token: "O", name: "Mary") }

  describe "#game_over?" do
    context "when there is a winning line" do
      before do
        game.instance_variable_set(:@board, ["X", "X", "O", "O", "X", "O", nil, "X", nil])
        game.instance_variable_get(:@line)
      end
      it "returns true if there is a winner" do
        winner = game.win?
        expect(winner).to be(true)
      end
    end
  end

  describe "#initialize" do
    # sets instance variables. No testing needed.
  end

  describe "#print_board" do
    # glorified puts command. No testing needed.
  end

  describe "#game_loop" do
    context "when the game is over" do
      before do
        game.instance_variable_set(:@board, ["X", "O", "X", "O", "X", "O", nil, nil, nil])
        game.instance_variable_get(:@line)
      end
      it "" do
      end
    end
  end

  describe "#check_tie" do
  end

  describe "#spot_empty?" do
  end

  describe "#get_name" do
  end
end
