class TeamsController < ApplicationController
  def index
    @team = Team.all.order(created_at: :desc)
  end
  
  def show
    @team = Team.find(params[:id])
  end
end
