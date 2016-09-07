require 'rails_helper'

RSpec.describe Country, type: :model do
  let(:country) { build_stubbed :test_country }

  it 'has a league' do
    expect(country.league).to be_a League
  end
end
