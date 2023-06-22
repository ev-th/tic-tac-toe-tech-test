require 'board'

RSpec.describe Board do
  let(:board) { described_class.new }

  it "is initialized with an empty grid" do
    
    expected_grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    
    expect(board.grid).to eq expected_grid
  end
  
  it "can place a player's symbol on the grid" do
    board.place("X", "B2")
    
    expected_grid = [[nil, nil, nil], [nil, "X", nil], [nil, nil, nil]]
    
    expect(board.grid).to eq expected_grid
  end
  
  it "can place another player's symbol on the grid" do
    board.place("O", "A1")
    
    expected_grid = [["O", nil, nil], [nil, nil, nil], [nil, nil, nil]]
    
    expect(board.grid).to eq expected_grid
  end

  describe "#winner" do
    it "starts with no winner and is not complete" do

      expect(board.winner).to eq nil
    end
    
    it "still has no winner when there are not three of the same symbols in a row" do
      board.place("X", "A1")
      board.place("O", "C3")
      board.place("X", "A3")
      board.place("O", "A2")
      board.place("X", "C1")
      board.place("O", "B1")
      
      expect(board.winner).to eq nil
    end
    
    it "has a winner when there are three symbols in a row horizontally" do
      board.place("X", "A1")
      board.place("X", "B1")
      board.place("X", "C1")

      expect(board.winner).to eq "X"
    end
    
    it "has a winner when there are three symbols in a row vertically" do
      board.place("O", "B1")
      board.place("O", "B2")
      board.place("O", "B3")
      expect(board.winner).to eq "O"
    end
    
    it "has a winner when there are three symbols in a row diagonally" do
      board.place("X", "A1")
      board.place("X", "B2")
      board.place("X", "C3")
      expect(board.winner).to eq "X"
    end
    
    it "cannot place a symbol on a place that is already claimed" do
      board.place("X", "A1")
      expect { board.place("X", "A1") }.to raise_error(
        'Player cannot claim a field that is already claimed.'
      )
    end
  end

  describe "#complete?" do
    it 'returns false when initialized' do
      expect(board.complete?).to eq false
    end

    it 'returns false when there is not three in a row' do
      board.place("X", "A1")
      board.place("O", "C3")
      board.place("X", "A3")
      board.place("O", "A2")
      board.place("X", "C1")
      board.place("O", "B1")
      expect(board.complete?).to eq false
    end
    
    it 'returns true when there are three in a row' do
      board.place("O", "B1")
      board.place("O", "B2")
      board.place("O", "B3")
      expect(board.complete?).to eq true
    end
    
    it 'returns true when there are no empty fields' do
      board.place('X', "A1")
      board.place('O', "B1")
      board.place('X', "C1")
      board.place('O', "A2")
      board.place('X', "B2")
      board.place('O', "A3")
      board.place('X', "C2")
      board.place('O', "C3")
      board.place('X', "B3")
      expect(board.winner).to eq nil
      expect(board.complete?).to eq true
    end
  end
end