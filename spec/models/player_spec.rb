require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { build :test_player }

  it 'has a player stat' do
    expect(player.player_stat).to be_a PlayerStat
  end

  it 'has home matches' do
    expect(player.home_matches).to all be_a Match
  end

  it 'has away matches' do
    expect(player.away_matches).to all be_a Match
  end
end
