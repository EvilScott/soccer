require 'rails_helper'

RSpec.describe Season, type: :model do
  let(:season) { create :test_season }

  it 'has matches' do
    expect(season.matches).to all be_a Match
  end
end
