class Game
  attr_reader :current_player, :board

  def initialize(board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @current_player = player_1
  end

  def get_board_grid
    @board.grid
  end
end