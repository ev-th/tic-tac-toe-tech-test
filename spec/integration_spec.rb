RSpec.describe "integration" do
  xit "sets up a game with an empty board" do
    board = Board.new
    game = Game.new(board, Player.new, Player.new)
    player = game.current_player
    player.move("A3")

    result_grid = board.grid
    expected_grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, "X"]]

    expect(result_grid).to eq expected_grid
  end
end