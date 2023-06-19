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

  describe "#winner" do
    it "starts with no winner" do
      board = Board.new

      expect(board.winner).to eq nil
    end
    
    it "still has no winner when there are not three of the same symbols in a row" do
      board = Board.new
      board.place("X", "A1")
      board.place("O", "C3")
      board.place("X", "A3")
      board.place("O", "A2")
      board.place("X", "C1")
      board.place("O", "B1")
      
      expect(board.winner).to eq nil
    end
    
    it "has a winner when there are three symbols in a row horizontally" do
      board = Board.new
      board.place("X", "A1")
      board.place("X", "B1")
      board.place("X", "C1")

      expect(board.winner).to eq "X"
    end
    
    it "has a winner when there are three symbols in a row vertically" do
      board = Board.new
      board.place("O", "B1")
      board.place("O", "B2")
      board.place("O", "B3")
      expect(board.winner).to eq "O"
    end
    
    it "has a winner when there are three symbols in a row diagonally" do
      board = Board.new
      board.place("X", "A1")
      board.place("X", "B2")
      board.place("X", "C3")
      expect(board.winner).to eq "X"
    end
  end
end