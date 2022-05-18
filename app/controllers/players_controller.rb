class PlayersController < ApplicationController
  def index
    @players = Player.is_healthy
  end

  def show
    @players = Player.find(params[:id])
  end

  def edit
    @player_id = params[:id]
  end

  def update
    player = Player.find(params[:id])
    player.update(player_params)
    redirect_to "/players/#{player.id}"
  end


  private

    def player_params
      params.permit(:fname, :lname, :jersey, :healthy)
    end
end
