class TeamPlayersController < ApplicationController
  def index
    @teams = Team.find(params[:id])
    @players = @teams.players
    if params[:alphabetize]
      @players = @teams.players.alphabetize
    end
    if params[:jerseys]
      @players = @teams.players.jersey_higher_than(params[:number])
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

  def jerseys
    redirect_to action: "index", jerseys: true
  end

  private

    def team_players_params
      params.permit(:fname, :lname, :jersey, :healthy)
    end
end
