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

  def self.get_logs(std_abbr, full_name, year, week = nil)
    base_params = {
      season_id: self.convert_to_slug("#{year}") + "-#{year+1}",
      team_id: self.convert_to_slug(std_abbr),
      player_id: self.convert_to_slug(full_name)}
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
