class TeamPlayersController < ApplicationController
  def index
    @teams = Team.find(params[:id])
    @players = @teams.players
    # require "pry"; binding.pry
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    team = Team.find(params[:id])
    team.players.create(team_players_params)
    redirect_to "/teams/#{team.id}/players"
  end

  private

    def team_players_params
      params.permit(:fname, :lname, :jersey, :healthy)
    end
end
