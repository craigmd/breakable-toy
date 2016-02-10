require 'rails_helper'

FactoryGirl.define do
  factory :team do
    name "Carolina Panthers"
    alt_abbr "CAR"
    std_abbr "CAR"
  end

  factory :player do
    full_name "Cam Newton"
    position "QB"

    association :team, factory: :team
  end

  factory :period do
    year "2015"
    week "17"
  end

  factory :matchup do
    dk_salary "7500"

    association :team, factory: :team
    association :player, factory: :player
    association :period, factory: :period
  end

  factory :offensive_result do
    passing_att 45
    passing_comp 30
    passing_yds 245
    passing_td 2
    passing_int 1
    passing_2pt 0
    rushing_att 5
    rushing_yds 34
    rushing_td 1
    rushing_2pt 0
    receiving_tar 0
    receiving_rec 0
    receiving_yds 0
    receiving_td 0
    receiving_2pt 0
    fumbles_fl 0
    fumbles_td 0
    returns_ko 0
    returns_pnt 0

    association :matchup, factory: :matchup  
  end
end
