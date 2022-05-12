class TeamsController < ApplicationController
  def index
    @team = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end
end
