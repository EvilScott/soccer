require 'rails_helper'

RSpec.describe PlayerStat, type: :model do
  let(:player_stat) { create :test_player_stat }

  it 'has a player' do
    expect(player_stat.player).to be_a Player
  end
end
