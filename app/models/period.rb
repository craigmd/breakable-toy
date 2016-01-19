class Period < ActiveRecord::Base
  validates :year, presence: true
  validates :week, presence: true
end
