require 'httparty'
require 'json'
require 'player'

class Stattleship
  include HTTParty

  base_uri "https://www.stattleship.com"
  headers "Content-type" => "application/json"
  headers "Authorization" => "Token token=#{ENV['STATTLESHIP_TOKEN']}"
  headers "Accept" => "application/vnd.stattleship.com; version=1"

  def self.convert_to_slug(s)
    "nfl-" + s.gsub(/(\W )|[.' ]/, '-').downcase
  end

  def self.get_logs(team_slug, player_slug, year, week = nil)
    base_params = {
      season_id: "nfl-#{year}-#{year + 1}",
      team_id: team_slug,
      player_id: player_slug}
    optional_params = {week: week}

    if week
      options = {query: base_params.merge(optional_params)}
    else
      options = {query: base_params}
    end

    sleep 1

    self.get("/football/nfl/game_logs", options).parsed_response
  end
end
