require 'httparty'
require 'json'

class Stattleship
  include HTTParty

  base_uri "https://www.stattleship.com"
  headers "Content-type" => "application/json"
  headers "Authorization" => "Token token=#{ENV['STATTLESHIP_TOKEN']}"
  headers "Accept" => "application/vnd.stattleship.com; version=1"

  def passes_attempts(season, team_abbr, player_first_name, player_last_name)
    options = { query: {
      feat: "passes_attempts",
      season_id: "nfl-#{season}-#{season+1}",
      team_id: "nfl-#{team_abbr}",
      player_id: "nfl-#{player_first_name}-#{player_last_name}" }
    }

    response = self.class.get("/football/nfl/feats", options).parsed_response

    week = response["games"][i]["interval_number"]
    passing_att = response["feats"][i]["actual"].to_i
  end
end
