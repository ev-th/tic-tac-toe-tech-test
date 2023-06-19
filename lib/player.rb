class Player
  attr_accessor :symbol
  
  def initialize(symbol)
    @symbol = symbol
  end

  def move(board, position)
    board.place(@symbol, position)
  end
end