teams = [{name: "Baltimore Ravens", alt_abbr: "BAL", std_abbr: "BAL", team_slug: Stattleship.convert_to_slug("BAL")},
{name: "Cincinnati Bengals", alt_abbr: "CIN", std_abbr: "CIN", team_slug: Stattleship.convert_to_slug("CIN")},
{name: "Cleveland Browns", alt_abbr: "CLE", std_abbr: "CLE", team_slug: Stattleship.convert_to_slug("CLE")},
{name: "Pittsburgh Steelers", alt_abbr: "PIT", std_abbr: "PIT", team_slug: Stattleship.convert_to_slug("PIT")},
{name: "Houston Texans", alt_abbr: "HOU", std_abbr: "HOU", team_slug: Stattleship.convert_to_slug("HOU")},
{name: "Indianapolis Colts", alt_abbr: "IND", std_abbr: "IND", team_slug: Stattleship.convert_to_slug("IND")},
{name: "Jacksonville Jaguars", alt_abbr: "JAC", std_abbr: "JAC", team_slug: Stattleship.convert_to_slug("JAC")},
{name: "Tennessee Titans", alt_abbr: "TEN", std_abbr: "TEN", team_slug: Stattleship.convert_to_slug("TEN")},
{name: "Buffalo Bills", alt_abbr: "BUF", std_abbr: "BUF", team_slug: Stattleship.convert_to_slug("BUF")},
{name: "Miami Dolphins", alt_abbr: "MIA", std_abbr: "MIA", team_slug: Stattleship.convert_to_slug("MIA")},
{name: "New England Patriots", alt_abbr: "NWE", std_abbr: "NE", team_slug: Stattleship.convert_to_slug("NE")},
{name: "New York Jets", alt_abbr: "NYJ", std_abbr: "NYJ", team_slug: Stattleship.convert_to_slug("NYJ")},
{name: "Denver Broncos", alt_abbr: "DEN", std_abbr: "DEN", team_slug: Stattleship.convert_to_slug("DEN")},
{name: "Kansas City Chiefs", alt_abbr: "KAN", std_abbr: "KC", team_slug: Stattleship.convert_to_slug("KC")},
{name: "Oakland Raiders", alt_abbr: "OAK", std_abbr: "OAK", team_slug: Stattleship.convert_to_slug("OAK")},
{name: "San Diego Chargers", alt_abbr: "SDG", std_abbr: "SD", team_slug: Stattleship.convert_to_slug("SD")},
{name: "Chicago Bears", alt_abbr: "CHI", std_abbr: "CHI", team_slug: Stattleship.convert_to_slug("CHI")},
{name: "Detriot Lions", alt_abbr: "DET", std_abbr: "DET", team_slug: Stattleship.convert_to_slug("DET")},
{name: "Green Bay Packers", alt_abbr: "GNB", std_abbr: "GB", team_slug: Stattleship.convert_to_slug("GB")},
{name: "Minnesota Vikings", alt_abbr: "MIN", std_abbr: "MIN", team_slug: Stattleship.convert_to_slug("MIN")},
{name: "Atlanta Falcons", alt_abbr: "ATL", std_abbr: "ATL", team_slug: Stattleship.convert_to_slug("ATL")},
{name: "Carolina Panthers", alt_abbr: "CAR", std_abbr: "CAR", team_slug: Stattleship.convert_to_slug("CAR")},
{name: "New Orleans Saints", alt_abbr: "NOR", std_abbr: "NO", team_slug: Stattleship.convert_to_slug("NO")},
{name: "Tampa Bay Buccaneers", alt_abbr: "TAM", std_abbr: "TB", team_slug: Stattleship.convert_to_slug("TB")},
{name: "Dallas Cowboys", alt_abbr: "DAL", std_abbr: "DAL", team_slug: Stattleship.convert_to_slug("DAL")},
{name: "New York Giants", alt_abbr: "NYG", std_abbr: "NYG", team_slug: Stattleship.convert_to_slug("NYG")},
{name: "Philadelphia Eagles", alt_abbr: "PHI", std_abbr: "PHI", team_slug: Stattleship.convert_to_slug("PHI")},
{name: "Washington Redskins", alt_abbr: "WAS", std_abbr: "WAS", team_slug: Stattleship.convert_to_slug("WAS")},
{name: "Arizona Cardinals", alt_abbr: "ARI", std_abbr: "ARI", team_slug: Stattleship.convert_to_slug("ARI")},
{name: "San Francisco 49ers", alt_abbr: "SFO", std_abbr: "SF", team_slug: Stattleship.convert_to_slug("SF")},
{name: "Seattle Seahawks", alt_abbr: "SEA", std_abbr: "SEA", team_slug: Stattleship.convert_to_slug("SEA")},
{name: "St. Louis Rams", alt_abbr: "STL", std_abbr: "STL", team_slug: Stattleship.convert_to_slug("STL")}]

#Seed Teams
teams.each do |team|
  Team.find_or_create_by(team)
end

17.times do |i|
  #Seed Periods
  Period.find_or_create_by(year: "2015", week: "#{i+1}")

  CSV.foreach("db/delimited_files/2015/dk_2015_#{i+1}.csv", {headers: true, col_sep: ";"}) do |row|
    names = row[3].split(", ")
    @full_name = "#{names[1]} #{names[0]}"
    @week = row[0]
    @position = row[4]
    @team = row[5].upcase
    @opponent = row[7].upcase
    @salary = row[9]

    next if @opponent == "-"

    def get_current_player_team
      Team.find_by(alt_abbr: @team)
    end

    def get_current_player_opp
      Team.find_by(alt_abbr: @opponent)
    end

    def get_current_player
      Player.find_by(
        full_name: @full_name,
        position: @position,
        team_id: get_current_player_team.id)
    end

    def get_current_period
      Period.find_by(year: "2015", week: @week)
    end

    # #Seed Players
    Player.find_or_create_by(
      full_name: @full_name,
      position: @position,
      player_slug: Stattleship.convert_to_slug(@full_name),
      team_id: get_current_player_team.id)

    #Seed Matchups
    Matchup.find_or_create_by(
      player_id: get_current_player.id,
      team_id: get_current_player_opp.id,
      period_id: get_current_period.id,
      dk_salary: @salary)
  end
end

@off_stats = [
  "passes_percentage",
  "passes_completions",
  "passes_yards_gross",
  "passes_touchdowns",
  "passes_interceptions",
  "passing_2pt_conversions_succeeded",
  "rushes_attempts",
  "rushes_yards",
  "rushes_touchdowns",
  "rushing_2pt_conversions_succeeded",
  "receptions_looks",
  "receptions_total",
  "receptions_yards",
  "receptions_touchdowns",
  "receiving_2pt_conversions_succeeded",
  "fumbles_lost",
  "fumbles_own_touchdowns",
  "kickoff_return_touchdowns",
  "punt_return_touchdowns"]

Player.where.not(position: "Def").each do |player| #do defenses later
  response = Stattleship.get_logs(player.team.team_slug, player.player_slug, 2015)

  if response.has_key?("error")
    player.update(player_slug: "fix")
    next
  else
    games = response["games"]
    logs = response["game_logs"]

    Matchup.where(player_id: player.id).each do |matchup|
      @off_stats.each do |off_stat|
        instance_variable_set("@" + off_stat, 0)

        logs.each_with_index do |log, i|
          week = games[i]["interval_number"]

          if off_stat == "passes_percentage"
            value = log[off_stat].to_f
          else
            value = log[off_stat].to_i
          end

          instance_variable_set("@" + off_stat, value) if week == matchup.period.week
        end
      end

      #Pass attempts proxy
      if @passes_percentage == 0
        @passes_attempts = 0 #Though this may not be true, its the best we gots
      else
        @passes_attempts = (@passes_completions/@passes_percentage).round
      end

      #Seed Offensive Results
      OffensiveResult.find_or_create_by(
        matchup_id: matchup.id,
        passing_att: @passes_attempts,
        passing_comp: @passes_completions,
        passing_yds: @passes_yards_gross,
        passing_td: @passes_touchdowns,
        passing_int: @passes_interceptions,
        passing_2pt: @passing_2pt_conversions_succeeded,
        rushing_att: @rushes_attempts,
        rushing_yds: @rushes_yards,
        rushing_td: @rushes_touchdowns,
        rushing_2pt: @rushing_2pt_conversions_succeeded,
        receiving_tar: @receptions_looks,
        receiving_rec: @receptions_total,
        receiving_yds: @receptions_yards,
        receiving_td: @receptions_touchdowns,
        receiving_2pt: @receiving_2pt_conversions_succeeded,
        returns_ko: @kickoff_return_touchdowns,
        returns_pnt: @punt_return_touchdowns,
        fumbles_fl: @fumbles_lost,
        fumbles_td: @fumbles_own_touchdowns)
    end
  end
end
