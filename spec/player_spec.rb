# frozen_string_literal: true

require 'player'

RSpec.describe Player do
  it 'has a symbol' do
    player = described_class.new('X')

    expect(player.symbol).to eq 'X'
  end
end
