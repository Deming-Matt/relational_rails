class TeamsController < ApplicationController
  def index
    @teams = Team.recently_created
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

  def edit
    @team_id = params[:id]
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to "/teams/#{team.id}"
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    redirect_to "/teams"
  end

  private

    def team_params
      params.permit(:name, :roster_spots, :full_roster)
    end
end
