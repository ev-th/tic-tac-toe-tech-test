class Board
  attr_accessor :grid

  def initialize
    @grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  def place(symbol, position)
    column_indices = {"A" => 0, "B" => 1, "C" => 2}
    column = column_indices[position[0]]

    row = position[1].to_i - 1

    @grid[row][column] = symbol
  end
end