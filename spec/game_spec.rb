require_relative "../lib/tic_tac_toe_game"
require_relative "../lib/player"
require_relative "../lib/human_player"

describe TicTacToeGame do
  # let(:player_one) { HumanPlayer.new(self, "X", "Mark") }
  # let(:player_two) { HumanPlayer.new(self, "O", "Mary") }
  let(:player_one) { instance_double("HumanPlayer") }
  let(:player_two) { instance_double("HumanPlayer") }
  subject(:game) { described_class.new(player_one, player_two) }

  before do
    allow(player_one).to receive(:instance_variable_get).with(:@name).and_return("Mark")
    allow(player_one).to receive(:instance_variable_get).with(:@token).and_return("X")
    allow(player_one).to receive(:token).and_return("X")

    allow(player_two).to receive(:instance_variable_get).with(:@name).and_return("Mary")
    allow(player_two).to receive(:instance_variable_get).with(:@token).and_return("O")
    allow(player_two).to receive(:token).and_return("O")
  end

  describe "#check_win" do
    context "when there is a winning line" do
      before do
        game.instance_variable_set(:@board,
          ["X", "X", "O",
            "O", "X", "O",
            7, "X", 9])
        game.instance_variable_get(:@line)
      end
      it "returns true if there is a winner" do
        p player_one.instance_variable_get(:@token)
        p player_two.token
        p player_one.instance_variable_get(:@name)
        p player_two.instance_variable_get(:@name)
        winner = game.check_win
        expect(winner).to be(true)
      end
    end
  end

  describe "#initialize" do
    # sets instance variables. No testing needed.
  end

  describe "#print_board" do
    it "prints the current state of the board" do
      expect { game.print_board }.to output("1 | 2 | 3\n--+---+--\n4 | 5 | 6\n--+---+--\n7 | 8 | 9\n--+---+--\n").to_stdout
    end
  end

  describe "#game_loop" do
  end

  describe "#check_tie" do
  end

  describe "#spot_empty?" do
  end

  describe "#get_name" do
  end
end
