Rails.application.routes.draw do
  get '/leagues', to: 'leagues#index', as: 'leagues'
  get '/league/:league_slug', to: 'leagues#show', as: 'league'
  get '/league/:league_slug/teams', to: 'teams#index', as: 'teams'
  get '/league/:league_slug/team/:team_slug', to: 'teams#show', as: 'team'
end
