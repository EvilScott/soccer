class Team < ActiveRecord::Base
  belongs_to :league
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_team_id'

  def to_param
    short_name
  end

  def as_json(options = {})
    options[:only] ||= %i(name short_name)
    super
  end
end
