Rails.application.routes.draw do
  get '/leagues', to: 'leagues#index'
  get '/league/:league_slug', to: 'leagues#show'
  get '/league/:league_slug/teams', to: 'teams#index'
  get '/league/:league_slug/team/:team_slug', to: 'teams#show'
end
