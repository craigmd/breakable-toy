class Team < ActiveRecord::Base
  has_many :players
  has_many :matchups

  validates :name, presence: true, uniqueness: true
  validates :alt_abbr, presence: true, uniqueness: true
  validates :std_abbr, presence: true, uniqueness: true
  validates :team_slug, presence: true, uniqueness: true
end
