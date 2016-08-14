class Player < ActiveRecord::Base
  has_one :player_stat
  has_and_belongs_to_many :home_matches, class_name: 'Match', join_table: 'matches_home_players'
  has_and_belongs_to_many :away_matches, class_name: 'Match', join_table: 'matches_home_players'
end
