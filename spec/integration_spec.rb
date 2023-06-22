# frozen_string_literal: true

require 'board'
require 'game'
require 'player'

RSpec.describe 'integration' do
  let(:board) { Board.new }
  let(:player1) { Player.new('X') }
  let(:player2) { Player.new('O') }
  let(:game) { Game.new(board, player1, player2) }

  it 'sets up a game and first player can place an X on the board' do
    game.move('A3')

    expected_grid = [[nil, nil, nil], [nil, nil, nil], ['X', nil, nil]]
    expect(game.get_board_grid).to eq expected_grid
  end

  it 'allows the second player to place an O on the board' do
    game.move('A3')
    game.move('B2')

    expected_grid = [[nil, nil, nil], [nil, 'O', nil], ['X', nil, nil]]
    expect(game.get_board_grid).to eq expected_grid
  end

  it 'is not game over until a player has placed 3 in a row' do
    game.move('A3')
    game.move('B2')

    expect(game.over?).to be false
  end

  it 'has a winner and is over once a player has placed 3 in a row vertically' do
    game.move('A1')
    game.move('B1')
    game.move('A2')
    game.move('B2')
    game.move('A3')

    expect(game.get_winner).to be player1
    expect(game.over?).to be true
  end

  it 'has a winner and is over once a player has placed 3 in a row horizontally' do
    game.move('A1')
    game.move('A3')
    game.move('A2')
    game.move('B3')
    game.move('B1')
    game.move('C3')

    expect(game.get_winner).to be player2
    expect(game.over?).to be true
  end

  it 'has a winner and is over once a player has placed 3 in a row diagonally' do
    game.move('A1')
    game.move('B1')
    game.move('B2')
    game.move('C1')
    game.move('C3')

    expect(game.get_winner).to be player1
    expect(game.over?).to be true
  end

  it 'does not allow players to claim a field that is already taken' do
    game.move('A1')
    expect { game.move('A1') }.to raise_error(
      'Player cannot claim a field that is already claimed.'
    )
  end

  context 'when all of the fields are taken without a player getting 3 in a row' do
    it 'the game is over without a winner' do
      game.move('A1')
      game.move('B1')
      game.move('C1')
      game.move('A2')
      game.move('B2')
      game.move('A3')
      game.move('C2')
      game.move('C3')
      game.move('B3')

      expect(game.get_winner).to be nil
      expect(game.over?).to be true
    end
  end
end
