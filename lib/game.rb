# frozen_string_literal: true

class Game
  attr_reader :current_player

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
    @board.place(@current_player.symbol, position)
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def over?
    @board.complete?
  end

  def get_winner
    return nil if @board.winner.nil?
    return @player1 if @board.winner == @player1.symbol
    return @player2 if @board.winner == @player2.symbol
  end
end
