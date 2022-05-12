class TeamsController < ApplicationController
  def index
    # require "pry"; binding.pry
    @team = Team.all
  end
end
