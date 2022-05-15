class TeamPlayersController < ApplicationController
  def index
    @teams = Team.find(params[:id])
    @players = @teams.players
    # require "pry"; binding.pry
  end
end
