class Game
  attr_reader :current_player
  def initialize(board, player_x, player_o)
    @board = board
    @player_x = player_x
    @player_o = player_o
    @current_player = player_x
  end
end