class Game
  attr_reader :current_player, :board, :winner

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def get_board_grid
    @board.grid
  end

  def move(position)
    symbol = @current_player.symbol
    @board.place(symbol, position)
    switch_player
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def over?
    !@winner.nil?
  end

  def get_winner
    winning_symbol = @board.winner
    return @player1 if winning_symbol == @player1.symbol
    return @player2 if winning_symbol == @player2.symbol
    return nil
  end
end