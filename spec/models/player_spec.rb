require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { create :test_player }

  it 'has a player stat' do
    expect(player.player_stat).to be_a PlayerStat
  end

  it 'has home matches' do
    expect(player.home_matches).to all be_a Match
  end

  it 'has away matches' do
    expect(player.away_matches).to all be_a Match
  end

  it 'has many teams' do
    expect(player.teams).to all be_a Team
  end
end
