class MatchupsController < ApplicationController
  def index
    @matchups = Matchup.where(period_id: Period.last)
      .includes(:team, player: [:team, :offensive_results])
      .order(dk_salary: :desc)
  end
end
