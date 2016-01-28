class OffensiveResult < ActiveRecord::Base
  belongs_to :matchup

  validates :passing_att, presence: true
  validates :passing_comp, presence: true
  validates :passing_yds, presence: true
  validates :passing_td, presence: true
  validates :passing_int, presence: true
  validates :passing_2pt, presence: true
  validates :rushing_att, presence: true
  validates :rushing_yds, presence: true
  validates :rushing_td, presence: true
  validates :rushing_2pt, presence: true
  validates :receiving_tar, presence: true
  validates :receiving_rec, presence: true
  validates :receiving_yds, presence: true
  validates :receiving_td, presence: true
  validates :receiving_2pt, presence: true
  validates :fumbles_fl, presence: true
  validates :fumbles_td, presence: true
  validates :returns_ko, presence: true
  validates :returns_pnt, presence: true
  validates :matchup_id, presence: true

  def self.calc_points(result, with_tds = true)
    result.passing_yds > 300 ? passing_300 = 1 : passing_300 = 0
    result.rushing_yds > 100 ? rushing_100 = 1 : rushing_100 = 0
    result.receiving_yds > 100 ? receiving_100 = 1 : receiving_100 = 0

    base_calc = 0.04 * result.passing_yds -
      1 * result.passing_int +
      2 * result.passing_2pt +
      0.1 * result.rushing_yds +
      2 * result.rushing_2pt +
      1 * result.receiving_rec +
      0.1 * result.receiving_yds +
      2 * result.receiving_2pt -
      1 * result.fumbles_fl +
      3 * passing_300 +
      3 * rushing_100 +
      3 * receiving_100

    tds =  4 * result.passing_td +
      6 * result.rushing_td +
      6 * result.receiving_td +
      6 * result.fumbles_td +
      6 * result.returns_ko +
      6 * result.returns_pnt

    with_tds ? base_calc + tds : base_calc
  end

  def self.fppg(results, with_tds = true)
    total = 0.0;

    results.each do |result|
      with_tds ? total += calc_points(result) : total += calc_points(result, false)
    end

    (total / results.length).round(1)
  end
end
