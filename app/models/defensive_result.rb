class DefensiveResult < ActiveRecord::Base
  belongs_to :matchup

  # validates :sack, presence: true
  # validates :int, presence: true
  # validates :int_td, presence: true
  # validates :saf, presence: true
  # validates :fumble_rec, presence: true
  # validates :fumble_td, presence: true
  # validates :punt_blk, presence: true
  # validates :pa, presence: true
  validates :matchup_id, presence: true
end
