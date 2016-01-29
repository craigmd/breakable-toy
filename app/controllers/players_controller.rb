class PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
    @matchups = Matchup.order(:period_id).where(player_id: params[:id]).last(16)
  end
end
