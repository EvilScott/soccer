class TeamsController < ApplicationController
  def index
    @teams = League.find_by_slug(params[:league_slug]).teams
    respond_to do |format|
      format.html
      format.json { render json: @teams }
    end
  end

  def show
    @team = Team.find_by_short_name(params[:team_slug].upcase)
    respond_to do |format|
      format.html
      format.json { render json: @team }
    end
  end
end
