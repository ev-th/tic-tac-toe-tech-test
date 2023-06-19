require 'game'

RSpec.describe Game do
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
end