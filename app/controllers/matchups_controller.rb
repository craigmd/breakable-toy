class MatchupsController < ApplicationController
  def index
    @matchups = Matchup.where(period_id: Period.last)
  end
end
