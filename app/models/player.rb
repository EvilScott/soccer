class Player < ActiveRecord::Base
  has_one :player_stat
  has_and_belongs_to_many :home_matches, class_name: 'Match', join_table: 'matches_home_players'
  has_and_belongs_to_many :away_matches, class_name: 'Match', join_table: 'matches_away_players'

  def teams
    (home_matches.includes(:home_team).map(&:home_team) + away_matches.includes(:away_team).map(&:away_team)).uniq
  end
end
