class Player
  attr_reader :token, :name

  def initialize(player_class, token, name)
    @player_class = player_class
    @token = token
    @name = name
  end
end
