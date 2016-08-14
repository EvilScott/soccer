class Match < ActiveRecord::Base
  belongs_to :country
  belongs_to :league
  belongs_to :season
  belongs_to :home_team, class_name: 'Team', foreign_key: :home_team_id
  belongs_to :away_team, class_name: 'Team', foreign_key: :away_team_id
  has_and_belongs_to_many :home_players, class_name: 'Player', join_table: 'matches_home_players'
  has_and_belongs_to_many :away_players, class_name: 'Player', join_table: 'matches_home_players'
end
