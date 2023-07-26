require_relative "../lib/tic_tac_toe_game"
require_relative "../lib/player"
require_relative "../lib/human_player"

describe TicTacToeGame do
  # let(:player_one) { HumanPlayer.new(self, "X", "Mark") }
  # let(:player_two) { HumanPlayer.new(self, "O", "Mary") }
  let(:game) { described_class.new(player_one, player_two) }
  let(:player_one) { instance_double("HumanPlayer", token: "X", name: "Mark") }
  let(:player_two) { instance_double("HumanPlayer", token: "O", name: "Mary") }

  describe "#win?" do
    context "when there is a winning line" do
      before do
        game.instance_variable_set(:@board, [nil, "X", "X", "O", "O", "X", "O", nil, "X", nil])
      end

      it "returns true" do
        expect(game.win?).to eq(true)
      end
      it "does not return false" do
        expect(game.win?).not_to eq(false)
      end
    end
  end

  describe "#tie?" do
    context "when there is a full board and no win" do
      before do
        game.instance_variable_set(:@board, [nil, "X", "O", "X", "X", "O", "O", "O", "X", "X"])
      end

      it "returns true for a tie" do
        expect(game.tie?).to eq(true)
      end

      it "returns false for a win" do
        expect(game.win?).to eq(false)
      end
    end
  end
  describe "#game_over?" do
    context "when there is a winning line" do
      before do
        game.instance_variable_set(:@board, [nil, "X", "X", "O", "O", "X", "O", nil, "X", nil])
      end

      it "returns true if there is a winner" do
        winner = game.game_over?
        expect(winner).to eq(true)
      end
    end

    context "when there is a tie" do
      before do
        game.instance_variable_set(:@board, [nil, "X", "O", "X", "X", "O", "X", "O", "X", "O"])
      end

      it "returns true" do
        tie = game.game_over?
        expect(tie).to eq(true)
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
        allow(game).to receive(:game_over?).and_return(false, false, "win")
        allow(game).to receive(:handle_game_result)
        allow(player_one).to receive(:place_token)
        allow(player_two).to receive(:place_token)
      end

      it "breaks the loop when game ends" do
        expect(game).to receive(:print_board).exactly(3).times
        expect(game).to receive(:handle_game_result).with("win")
        game.game_loop
      end
    end
  end

  describe "#spot_empty?" do
    context "when the spot has a nil value" do
      before do
        game.instance_variable_set(:@board, [nil, "X", "X", "O", "O", "X", "O", nil, "X", nil])
      end

      it "returns true" do
        position_seven = 7
        expect(game.spot_empty?(position_seven)).to eql(true)
      end
      it "does not return false" do
        position_seven = 7
        expect(game.spot_empty?(position_seven)).not_to eql(false)
      end
    end
  end
end
