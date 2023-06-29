require_relative "../lib/tic_tac_toe_game"
require_relative "../lib/player"
require_relative "../lib/human_player"

describe Game do
  let(:human_player) { class_double(HumanPlayer) }
  subject(:game) { described_class.new(human_player, human_player) }

  before do
    allow(human_player).to receive(:new)
    game.instance_variable_set(:@players,
      [human_player.new(self, "X", "Mark"),
        human_player.new(self, "O", "Mary")])
  end

  describe "#initialize" do
    # sets instance variables. Test to make sure instance variable is set correctly above..
    it "sets @players to the array of human players" do
      players = game.instance_variable_get(:@players)
      expected_array = [human_player.new(self, "X", "Mark"),
        human_player.new(self, "O", "Mary")]

      expect(players).to eq(expected_array)
    end
  end

  describe "#print_board" do
    it "prints the current state of the board" do
      expect { game.print_board }.to output("1 | 2 | 3\n--+---+--\n4 | 5 | 6\n--+---+--\n7 | 8 | 9\n--+---+--\n").to_stdout
    end
  end

  describe "#check_win" do
  end

  describe "#check_tie" do
  end

  describe "#spot_empty?" do
  end

  describe "#get_name" do
  end
end
