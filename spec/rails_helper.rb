ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before(:suite) do
    panthers = FactoryGirl.create(:team)
    bucs = FactoryGirl.create(
      :team,
      name: "Tampa Bay Buccaneers",
      alt_abbr: "TAM",
      std_abbr: "TB"
    )
    cam_newton = FactoryGirl.create(:player, team: panthers)
    this_week = FactoryGirl.create(:period)
    matchup = FactoryGirl.create(
      :matchup,
      team: bucs,
      player: cam_newton,
      period: this_week
    )
    week_17_results = FactoryGirl.create(:offensive_result, matchup: matchup)
  end
end
