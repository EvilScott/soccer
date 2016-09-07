require 'rails_helper'

RSpec.describe League, type: :model do
  let(:league) { create :test_league }

  it 'has a country' do
    expect(league.country).to be_a Country
  end

  it 'has many matches' do
    expect(league.matches).to all be_a Match
  end

  it 'has many teams' do
    expect(league.teams).to all be_a Team
  end
end
