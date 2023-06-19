require 'board'
require 'game'
require 'player'

RSpec.describe "integration" do
  it "sets up a game and first player can place an X on the board" do
    board = Board.new
    game = Game.new(board, Player.new("X"), Player.new("O"))
    current_player = game.current_player
    current_player.move(game.board, "A3")

    result_grid = game.get_board_grid
    expected_grid = [[nil, nil, nil], [nil, nil, nil], ["X", nil, nil]]

    expect(result_grid).to eq expected_grid
  end

  xit "allows the second player to place an O on the board" do
    board = Board.new
    game = Game.new(board, Player.new("X"), Player.new("O"))
    current_player = game.current_player
    current_player.move(board, "A3")
    current_player = game.current_player
    current_player.move(board, "B2")

    result_grid = game.get_board_grid
    expected_grid = [[nil, nil, nil], [nil, "O", nil], ["X", nil, nil]]

    expect(result_grid).to eq expected_grid
  end
end
