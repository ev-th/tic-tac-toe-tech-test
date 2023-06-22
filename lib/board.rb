class Board
  attr_accessor :grid

  def initialize
    @grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  def place(symbol, position)
    column_indices = {"A" => 0, "B" => 1, "C" => 2}
    column = column_indices[position[0]]

    row = position[1].to_i - 1
    if @grid[row][column].nil?
      @grid[row][column] = symbol
    else
      raise 'Player cannot claim a field that is already claimed.'
    end
  end

  def winner
    rows = get_winnable_rows
    winning_rows = rows.select { |row| winning_row?(row) }
    winning_rows.empty? ? nil : winning_rows[0][0]
  end

  private

  def get_winnable_rows
    winnable_rows = @grid + @grid.transpose
    winnable_rows.push [ @grid[0][0], @grid[1][1], @grid[1][1] ]
    winnable_rows.push [ @grid[2][0], @grid[1][1], @grid[0][2] ]
    winnable_rows
  end

  def winning_row?(row)
    row.uniq.length == 1 && !row.first.nil?
  end
end