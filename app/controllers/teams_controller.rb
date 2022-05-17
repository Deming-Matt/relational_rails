class TeamsController < ApplicationController
  def index
    @teams = Team.all.order(created_at: :desc)
  end

  def show
    @teams = Team.find(params[:id])
  end

  def new

  end

  def create
    Team.create(team_params)
    redirect_to "/teams"
  end

  private

    def team_params
      params.permit(:name, :roster_spots, :full_roster)
    end
end
