require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) { build :test_team }

  it 'has home_matches' do
    expect(team.home_matches).to all be_a Match
  end

  it 'has away_matches' do
    expect(team.away_matches).to all be_a Match
  end
end
