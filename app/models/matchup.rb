class Matchup < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  belongs_to :period

  validates :dk_salary, presence: true
  validates :team_id, presence: true
  validates :player_id, presence: true
  validates :period_id, presence: true
end
