# frozen_string_literal: true

class Board
  attr_accessor :grid

  def initialize
    @grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  def place(symbol, position)
    row = position[1].to_i - 1
    column = position[0].ord - 65

    raise_for_occupied(row, column)
    @grid[row][column] = symbol
  end

  def winner
    rows = get_winnable_rows
    winning_rows = rows.select { |row| winning_row?(row) }
    winning_rows.empty? ? nil : winning_rows[0][0]
  end

  def complete?
    !(@grid.flatten.any?(nil) && winner.nil?)
  end

  private

  def get_winnable_rows
    winnable_rows = @grid + @grid.transpose
    winnable_rows.push [@grid[0][0], @grid[1][1], @grid[2][2]]
    winnable_rows.push [@grid[2][0], @grid[1][1], @grid[0][2]]
    winnable_rows
  end

  def winning_row?(row)
    row.uniq.length == 1 && !row.first.nil?
  end

  def raise_for_occupied(row, column)
    error = 'Player cannot claim a field that is already claimed.'
    raise error if @grid[row][column]
  end
end
