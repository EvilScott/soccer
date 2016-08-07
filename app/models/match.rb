class Match < ActiveRecord::Base
  self.table_name = 'match'
  belongs_to :country
  belongs_to :league
  has_one :home_team, class_name: 'Team', foreign_key: 'team_api_id', primary_key: :home_team_api_id
  has_one :away_team, class_name: 'Team', foreign_key: 'team_api_id', primary_key: :away_team_api_id
end
