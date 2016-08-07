class Team < ActiveRecord::Base
  self.table_name = 'team'
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_api_id', primary_key: :team_api_id
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_team_api_id', primary_key: :team_api_id
end
