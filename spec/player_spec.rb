require 'player'

RSpec.describe Player do
  it "can place its symbol on the board" do
    player = Player.new("X")
    fake_board = double :fake_board
    
    expect(fake_board).to receive(:place).with("X", "B2").once

    player.move(fake_board, "B2")
  end
end