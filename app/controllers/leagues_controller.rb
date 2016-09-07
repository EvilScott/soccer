class LeaguesController < ApplicationController
  def index
    @leagues = League.all
    respond_to do |format|
      format.html
      format.json { render json: @leagues }
    end
  end

  def show
    @league = League.find_by_slug(params[:league_slug])
    respond_to do |format|
      format.html
      format.json { render json: @league }
    end
  end
end
