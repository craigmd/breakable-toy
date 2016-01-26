class OffensiveResult < ActiveRecord::Base
  belongs_to :matchup

  # validates :passing_att, presence: true
  # validates :passing_comp, presence: true
  # validates :passing_yds, presence: true
  # validates :passing_td, presence: true
  # validates :passing_int, presence: true
  # validates :passing_2pt, presence: true
  # validates :rushing_att, presence: true
  # validates :rushing_yds, presence: true
  # validates :rushing_td, presence: true
  # validates :rushing_2pt, presence: true
  # validates :receiving_tar, presence: true
  # validates :receiving_rec, presence: true
  # validates :receiving_yds, presence: true
  # validates :receiving_td, presence: true
  # validates :receiving_2pt, presence: true
  # validates :fumbles_fl, presence: true
  # validates :fumbles_td, presence: true
  # validates :returns_ko, presence: true
  # validates :returns_pnt, presence: true
  validates :matchup_id, presence: true
end
