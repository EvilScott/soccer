class AddLeagueToTeam < ActiveRecord::Migration[5.0]
  def change
    add_reference :teams, :league, foreign_key: true
    Team.all.each { |t| t.update(league: t.home_matches.first.league) }
  end
end
