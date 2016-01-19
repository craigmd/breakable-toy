class Player < ActiveRecord::Base
  belongs_to :team

  validates :full_name, presence: true
  validates :position, presence: true
  validates :dk_number, presence: true, uniqueness: true
  validates :eligibility_flag, inclusion: { in: [0, 1] }
  validates :team_id, presence: true
end
