require 'rails_helper'

RSpec.describe Match, type: :model do
  let(:match) { build_stubbed :test_match }

  it 'has a country' do
    expect(match.country).to be_a Country
  end

  it 'has a league' do
    expect(match.league).to be_a League
  end

  it 'has a season' do
    expect(match.season).to be_a Season
  end

  it 'has a home_team' do
    expect(match.home_team).to be_a Team
  end

  it 'has an away team' do
    expect(match.away_team).to be_a Team
  end

  it 'has home players' do
    expect(match.home_players).to all be_a Player
  end

  it 'has away players' do
    expect(match.away_players).to all be_a Player
  end
end
