class Player
  attr_reader :token, :name, :game

  def initialize(game_class, token, name)
    @game = game_class
    @token = token
    @name = name
  end
end
