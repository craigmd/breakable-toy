class Team < ActiveRecord::Base
  has_many :players
  has_many :matchups

  validates :name, presence: true, uniqueness: true
  validates :abbr, presence: true, uniqueness: true
end
