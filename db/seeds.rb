#Seed Teams
Team.create(name: "Baltimore Ravens", alt_abbr: "BAL", std_abbr: "BAL")
Team.create(name: "Cincinnati Bengals", alt_abbr: "CIN", std_abbr: "CIN" )
Team.create(name: "Cleveland Browns", alt_abbr: "CLE", std_abbr: "CLE")
Team.create(name: "Pittsburgh Steelers", alt_abbr: "PIT", std_abbr: "PIT")
Team.create(name: "Houston Texans", alt_abbr: "HOU", std_abbr: "HOU")
Team.create(name: "Indianapolis Colts", alt_abbr: "IND", std_abbr: "IND")
Team.create(name: "Jacksonville Jaguars", alt_abbr: "JAC", std_abbr: "JAC")
Team.create(name: "Tennessee Titans", alt_abbr: "TEN", std_abbr: "TEN")
Team.create(name: "Buffalo Bills", alt_abbr: "BUF", std_abbr: "BUF")
Team.create(name: "Miami Dolphins", alt_abbr: "MIA", std_abbr: "MIA")
Team.create(name: "New England Patriots", alt_abbr: "NWE", std_abbr: "NE")
Team.create(name: "New York Jets", alt_abbr: "NYJ", std_abbr: "NYJ")
Team.create(name: "Denver Broncos", alt_abbr: "DEN", std_abbr: "DEN")
Team.create(name: "Kansas City Chiefs", alt_abbr: "KAN", std_abbr: "KC")
Team.create(name: "Oakland Raiders", alt_abbr: "OAK", std_abbr: "OAK")
Team.create(name: "San Diego Chargers", alt_abbr: "SDG", std_abbr: "SD")
Team.create(name: "Chicago Bears", alt_abbr: "CHI", std_abbr: "CHI")
Team.create(name: "Detriot Lions", alt_abbr: "DET", std_abbr: "DET")
Team.create(name: "Green Bay Packers", alt_abbr: "GNB", std_abbr: "GB")
Team.create(name: "Minnesota Vikings", alt_abbr: "MIN", std_abbr: "MIN")
Team.create(name: "Atlanta Falcons", alt_abbr: "ATL", std_abbr: "ATL")
Team.create(name: "Carolina Panthers", alt_abbr: "CAR", std_abbr: "CAR")
Team.create(name: "New Orleans Saints", alt_abbr: "NOR", std_abbr: "NO")
Team.create(name: "Tampa Bay Buccaneers", alt_abbr: "TAM", std_abbr: "TB")
Team.create(name: "Dallas Cowboys", alt_abbr: "DAL", std_abbr: "DAL")
Team.create(name: "New York Giants", alt_abbr: "NYG", std_abbr: "NYG")
Team.create(name: "Philadelphia Eagles", alt_abbr: "PHI", std_abbr: "PHI")
Team.create(name: "Washington Redskins", alt_abbr: "WAS", std_abbr: "WAS")
Team.create(name: "Arizona Cardinals", alt_abbr: "ARI", std_abbr: "ARI")
Team.create(name: "San Francisco 49ers", alt_abbr: "SFO", std_abbr: "SF")
Team.create(name: "Seattle Seahawks", alt_abbr: "SEA", std_abbr: "SEA")
Team.create(name: "St. Louis Rams", alt_abbr: "STL", std_abbr: "STL")

17.times do |i|
  #Seed Periods
  Period.create(year: "2015", week: "#{i+1}")

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
      team_id: get_current_player_team.id)

    #Seed Matchups
    Matchup.create(
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

Player.where.not(position: "Def").each do |player|
  response = Stattleship.get_logs(player.team.std_abbr, player.full_name, 2015)
  games = response["games"]
  logs = response["game_logs"]

  next if logs.nil?

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

    if @passes_percentage == 0
      @passes_attempts = 0 #Though this may not be true, its the best we gots
    else
      @passes_attempts = (@passes_completions/@passes_percentage).round
    end

    #Seed Offensive Results
    OffensiveResult.create(
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
