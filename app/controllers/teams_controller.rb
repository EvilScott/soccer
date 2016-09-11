class TeamsController < ApplicationController
  def index
    @league = League.find_by_slug(params[:league_slug])
    @teams = @league.teams
    respond_to do |format|
      format.html
      format.json { render json: @teams }
    end
  end

  def show
    @league = League.find_by_slug(params[:league_slug])
    @team = @league.teams.find_by_short_name(params[:team_slug].upcase)
    respond_to do |format|
      format.html
      format.json { render json: @team }
    end
  end
end
