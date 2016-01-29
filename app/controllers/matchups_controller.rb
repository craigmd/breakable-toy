class MatchupsController < ApplicationController
  def index
    @matchups = Matchup.where(period_id: Period.last).includes(:team, player: [:team, :offensive_results])
  end
end
