class Team < ActiveRecord::Base
  has_many :players
  
  validates :name, presence: true, uniqueness: true
  validates :abbr, presence: true, uniqueness: true
  validates :stadium_zip, presence: true
end
