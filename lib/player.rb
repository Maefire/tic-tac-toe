class Player
  attr_reader :token, :name, :player_class

  def initialize(player_class, token, name = get_name)
    @player_class = player_class
    @token = token
    @name = name
  end

  def get_name
    unless player_class.instance_of?(HumanPlayer)
      puts "Please insert your name:"
      @name = gets.chomp
    end
  end
end
