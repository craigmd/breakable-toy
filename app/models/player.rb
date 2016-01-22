class Player < ActiveRecord::Base
  has_many :matchups
  belongs_to :team

  validates :full_name, presence: true
  validates :position, presence: true
  validates :team_id, presence: true
end
