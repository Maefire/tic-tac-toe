class HumanPlayer < Player
  def place_token
    loop do
      print "Choose a valid position(1-9) to place your #{token}:"
      chosen_spot = gets.to_i
      unless player_class.spot_empty?(chosen_spot) && (1..9).cover?(chosen_spot)
        puts "Choice is not a valid position. Please try again."
        next
      end
      player_class.board[chosen_spot] = token
      break
    end
  end
end
