require 'rails_helper'

RSpec.describe LeaguesController, type: :controller do
  let(:league) { build_stubbed :test_league }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { league_slug: league.slug }
      expect(response).to have_http_status(:success)
    end
  end
end
