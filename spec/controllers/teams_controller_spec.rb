require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let(:team) { create :test_team }

  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: { league_slug: team.league.slug }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { league_slug: team.league.slug, team_slug: team.short_name }
      expect(response).to have_http_status(:success)
    end
  end
end
