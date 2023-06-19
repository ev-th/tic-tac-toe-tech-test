require 'player'

RSpec.describe Player do
  it "has a symbol" do
    player = Player.new("X")

    expect(player.symbol).to eq "X"
  end
end