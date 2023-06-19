require 'board'

RSpec.describe Board do
  it "is initialized with an empty grid" do
    board = Board.new
    
    expected_grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    
    expect(board.grid).to eq expected_grid
  end
  
  it "can place a player's symbol on the grid" do
    board = Board.new
    board.place("X", "B2")
    
    expected_grid = [[nil, nil, nil], [nil, "X", nil], [nil, nil, nil]]
    
    expect(board.grid).to eq expected_grid
  end
  
  it "can place another player's symbol on the grid" do
    board = Board.new
    board.place("O", "A1")
    
    expected_grid = [["O", nil, nil], [nil, nil, nil], [nil, nil, nil]]
    
    expect(board.grid).to eq expected_grid
  end
end