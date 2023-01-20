lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
# begin Game
class Game
    # include GameLogic
    def initialize(player_one_class, player_two_class)  
        @board = Array.new(10)
    end
    def print_board
        puts " a \tb \tc" 
        puts "1 #{@board[1]} | #{@board[2]} | #{@board[3]} "
        puts " --+--+-- "
        puts "2 #{@board[4]} | #{@board[5]} | #{@board[6]} "
        puts " --+--+-- "
        puts "3 #{@board[7]} | #{@board[8]} | #{@board[9]} "
    end
    def game_loop
        @@count = 1
        loop do
            print_board  
            return
        end
    end
end

# shut up RuboCop
class GameLogic
    def initialize
    end
end

# shut up RuboCop
class Player
    def initialize(token) 
    end
end
# display_board(board)

test = Game.new("test","test2")
test.game_loop
puts "done"