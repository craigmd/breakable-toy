class Period < ActiveRecord::Base
  has_many :matchups

  validates :year, presence: true
  validates :week, presence: true
end
