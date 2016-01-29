class Matchup < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  belongs_to :period
  has_one :offensive_result

  validates :dk_salary, presence: true
  validates :team_id, presence: true
  validates :player_id, presence: true
  validates :period_id, presence: true

  # def ffpg
  #   if @ffpg
  #     @ffpg
  #   else
  #     caculate_ffpg
  #     @ffpg
  #   end
  # end
  #
  # def calculate_ffpg
  #   @base_calc = calculation
  #   @ffpgs = @base_calc + tds
  # end
  #
  # def ffpg_without_tds
  #   if @base_calc
  #     @base_calc
  #   else
  #     calculate_ffpg
  #     @base_calc
  #   end
  # end
end
