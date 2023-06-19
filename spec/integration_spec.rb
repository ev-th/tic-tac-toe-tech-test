require 'board'
require 'game'
require 'player'

RSpec.describe "integration" do
  it "sets up a game and first player can place an X on the board" do
    board = Board.new
    game = Game.new(board, Player.new("X"), Player.new("O"))
    game.move("A3")

    result_grid = game.get_board_grid
    expected_grid = [[nil, nil, nil], [nil, nil, nil], ["X", nil, nil]]

    expect(result_grid).to eq expected_grid
  end

  it "allows the second player to place an O on the board" do
    board = Board.new
    game = Game.new(board, Player.new("X"), Player.new("O"))
    game.move("A3")
    game.move("B2")

    result_grid = game.get_board_grid
    expected_grid = [[nil, nil, nil], [nil, "O", nil], ["X", nil, nil]]

    expect(result_grid).to eq expected_grid
  end

  it "is not game over until a player has placed 3 in a row" do
    board = Board.new
    game = Game.new(board, Player.new("X"), Player.new("O"))
    game.move("A3")
    game.move("B2")

    expect(game.over?).to be false
  end

  xit "has a winner and is over once a player has placed 3 in a row vertically" do
    board = Board.new
    player1 = Player.new("X")
    player2 = Player.new("O")
    game = Game.new(board, player1, player2)
    game.move("A1")
    game.move("B1")
    game.move("A2")
    game.move("B2")
    game.move("A3")

    expect(game.winner).to be player1
    expect(game.game_over?).to be true
  end
end
