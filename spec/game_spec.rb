require 'game'

RSpec.describe Game do
  describe "when initialized" do
    it "has no winner and the game is not over" do
      fake_player1 = double :fake_player1
      fake_player2 = double :fake_player2
      fake_board = double :fake_board, winner: nil
      game = Game.new(fake_board, fake_player1, fake_player2)

      expect(game.get_winner).to be nil
      expect(game.over?).to be false
    end 
  end

  it "can get the grid from the board" do
    fake_player1 = double :fake_player1
    fake_player2 = double :fake_player2
    fake_board = double :fake_board
    allow(fake_board).to receive(:grid).and_return([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    
    game = Game.new(fake_board, fake_player1, fake_player2)
    result = game.get_board_grid
    expected_result = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    
    expect(result).to eq expected_result
  end
  
  it "can allow the current player to make a move" do
    fake_player1 = double :fake_player1, symbol: "X"
    fake_player2 = double :fake_player2
    fake_board = double :fake_board
    game = Game.new(fake_board, fake_player1, fake_player2)
    expect(fake_board).to receive(:place).with("X", "C2")
    
    game.move("C2")
  end
  
  it "swaps player at the end of a move" do
    fake_player1 = double :fake_player1, symbol: nil
    fake_player2 = double :fake_player2, symbol: nil
    fake_board = double :fake_board, place: nil
    game = Game.new(fake_board, fake_player1, fake_player2)
    
    expect(game.current_player).to eq fake_player1
    game.move("C2")
    expect(game.current_player).to eq fake_player2
  end

  context "when the game is not complete" do
    it "cannot get a winner from the board" do
      fake_player1 = double :fake_player1, symbol: "X"
      fake_player2 = double :fake_player2, symbol: "O"
      fake_board = double :fake_board, winner: nil
      game = Game.new(fake_board, fake_player1, fake_player2)

      expect(game.get_winner).to be nil
    end
  
    it "is not game over" do
      fake_player1 = double :fake_player1, symbol: "X"
      fake_player2 = double :fake_player2, symbol: "O"
      fake_board = double :fake_board, winner: nil
      game = Game.new(fake_board, fake_player1, fake_player2)

      expect(game.over?).to be false
    end
  end
  
  context "when the game is complete" do
    it "gets the winning player based on the board's winning symbol" do
      fake_player1 = double :fake_player1, symbol: "X"
      fake_player2 = double :fake_player2, symbol: "O"
      fake_board = double :fake_board, winner: "X"
      game = Game.new(fake_board, fake_player1, fake_player2)

      expect(game.get_winner).to be fake_player1
    end
    
    it "is game over" do
      fake_player1 = double :fake_player1, symbol: "X"
      fake_player2 = double :fake_player2, symbol: "O"
      fake_board = double :fake_board, winner: "X"
      game = Game.new(fake_board, fake_player1, fake_player2)

      expect(game.over?).to be true
    end
  end
end