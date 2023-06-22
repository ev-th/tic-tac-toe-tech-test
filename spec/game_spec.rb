require 'game'

RSpec.describe Game do
  let(:fake_player1) { double :fake_player1, symbol: "X" }
  let(:fake_player2) { double :fake_player2, symbol: "O" }
  let(:fake_board) { fake_board = double :fake_board }
  let(:game) { described_class.new(fake_board, fake_player1, fake_player2) }

  it "can get the grid from the board" do
    allow(fake_board).to receive(:grid).and_return([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    
    expected_result = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]    
    expect(game.get_board_grid).to eq expected_result
  end
  
  it "can allow the current player to make a move" do
    expect(fake_board).to receive(:place).with("X", "C2")
    
    game.move("C2")
  end
  
  it "swaps player at the end of a move" do
    allow(fake_board).to receive(:place)
    
    expect(game.current_player).to eq fake_player1
    game.move("C2")
    expect(game.current_player).to eq fake_player2
  end
  
  it "is not game over when the board is not complete" do
    allow(fake_board).to receive(:complete?).and_return(false)
    
    expect(game.over?).to be false
  end 
  
  it "is game over when the board is complete" do
    allow(fake_board).to receive(:complete?).and_return(true)
    
    expect(game.over?).to be true
  end 
  
  it 'there is no winner when the board does not have a winning symbol' do
    allow(fake_board).to receive(:winner).and_return(nil)

    expect(game.get_winner).to be nil
  end

  it "gets the winner associated with the board's winning symbol" do
    allow(fake_board).to receive(:winner).and_return('X')

    expect(game.get_winner).to be fake_player1
  end
end