class TeamPlayersController < ApplicationController
  def index
    @teams = Team.find(params[:id])
    @players = @teams.players
    if params[:alphabetize]
      @players = @teams.players.alphabetize
    end
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    team = Team.find(params[:id])
    team.players.create(team_players_params)
    redirect_to "/teams/#{team.id}/players"
  end

  def alphabetize
    redirect_to action: "index", alphabetize: true
  end

  private

    def team_players_params
      params.permit(:fname, :lname, :jersey, :healthy)
    end
end
