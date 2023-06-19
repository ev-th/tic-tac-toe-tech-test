require 'board'
require 'game'
require 'player'

RSpec.describe "integration" do
  it "sets up a game with an empty board" do
    board = Board.new
    game = Game.new(board, Player.new("X"), Player.new("O"))
    player = game.current_player
    player.move(board, "A3")

    result_grid = board.grid
    expected_grid = [[nil, nil, nil], [nil, nil, nil], ["X", nil, nil]]

    expect(result_grid).to eq expected_grid
  end
end