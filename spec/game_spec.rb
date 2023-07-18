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
      end
      it "returns true if there is a winner" do
        winner = game.game_over?
        expect(winner).to eql("win")
      end
    end
    context "when there is a tie" do
      before do
        game.instance_variable_set(:@board, ["X", "O", "X", "X", "O", "X", "O", "X", "O"])
      end
      it "returns true if there is a tie" do
        winner = game.game_over?
        expect(winner).to eql("tie")
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
        allow(game).to receive(:print_board)
        allow(game).to receive(:game_over?).and_return("win")
        allow(game).to receive(:handle_game_result)
        allow(player_one).to receive(:place_token)
        allow(player_two).to receive(:place_token)
      end
      it "breaks the loop when game ends" do
        expect(game).to receive(:print_board).once
        expect(game).to receive(:handle_game_result).with("win")
        game.game_loop
      end
    end
  end

  describe "#spot_empty?" do
  end

  describe "#get_name" do
  end
end
