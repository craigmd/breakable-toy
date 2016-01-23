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

#Seed Periods
[2014, 2015].each do |year|
  17.times do |i|
    Period.create(year: "#{year}", week: "#{i+1}")
  end
end

#Seed Players
[2014, 2015].each do |year|
  17.times do |i|
    CSV.foreach("db/delimited_files/#{year}/dk_#{year}_#{i+1}.csv", {headers: true, col_sep: ";"}) do |row|
      Player.create(
        full_name: row[3],
        position: row[4],
        team_id: Team.find_by(alt_abbr: row[5].upcase).id
      ) if Player.find_by(
        full_name: row[3],
        position: row[4],
        team_id: Team.find_by(alt_abbr: row[5].upcase).id
      ).nil?
    end
  end
end
