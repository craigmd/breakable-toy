#Seed Teams
Team.create(name: "Baltimore Ravens", abbr: "BAL")
Team.create(name: "Cincinnati Bengals", abbr: "CIN")
Team.create(name: "Cleveland Browns", abbr: "CLE")
Team.create(name: "Pittsburgh Steelers", abbr: "PIT")
Team.create(name: "Houston Texans", abbr: "HOU")
Team.create(name: "Indianapolis Colts", abbr: "IND")
Team.create(name: "Jacksonville Jaguars", abbr: "JAC")
Team.create(name: "Tennessee Titans", abbr: "TEN")
Team.create(name: "Buffalo Bills", abbr: "BUF")
Team.create(name: "Miami Dolphins", abbr: "MIA")
Team.create(name: "New England Patriots", abbr: "NWE")
Team.create(name: "New York Jets", abbr: "NYJ")
Team.create(name: "Denver Broncos", abbr: "DEN")
Team.create(name: "Kansas City Chiefs", abbr: "KAN")
Team.create(name: "Oakland Raiders", abbr: "OAK")
Team.create(name: "San Diego Chargers", abbr: "SDG")
Team.create(name: "Chicago Bears", abbr: "CHI")
Team.create(name: "Detriot Lions", abbr: "DET")
Team.create(name: "Green Bay Packers", abbr: "GNB")
Team.create(name: "Minnesota Vikings", abbr: "MIN")
Team.create(name: "Atlanta Falcons", abbr: "ATL")
Team.create(name: "Carolina Panthers", abbr: "CAR")
Team.create(name: "New Orleans Saints", abbr: "NOR")
Team.create(name: "Tampa Bay Buccaneers", abbr: "TAM")
Team.create(name: "Dallas Cowboys", abbr: "DAL")
Team.create(name: "New York Giants", abbr: "NYG")
Team.create(name: "Philadelphia Eagles", abbr: "PHI")
Team.create(name: "Washington Redskins", abbr: "WAS")
Team.create(name: "Arizona Cardinals", abbr: "ARI")
Team.create(name: "San Francisco 49ers", abbr: "SFO")
Team.create(name: "Seattle Seahawks", abbr: "SEA")
Team.create(name: "St. Louis Rams", abbr: "STL")

#Seed Periods
Period.create(year: "2015", week: "1")
Period.create(year: "2015", week: "2")
Period.create(year: "2015", week: "3")
Period.create(year: "2015", week: "4")
Period.create(year: "2015", week: "5")
Period.create(year: "2015", week: "6")
Period.create(year: "2015", week: "7")
Period.create(year: "2015", week: "8")
Period.create(year: "2015", week: "9")
Period.create(year: "2015", week: "10")
Period.create(year: "2015", week: "11")
Period.create(year: "2015", week: "12")
Period.create(year: "2015", week: "13")
Period.create(year: "2015", week: "14")
Period.create(year: "2015", week: "15")
Period.create(year: "2015", week: "16")
Period.create(year: "2015", week: "17")

#Seed Players
CSV.foreach( "db/delimited_files/dk_2015_1.csv", { headers: true, col_sep: ";" } ) do |row|
  Player.create(full_name: row[3], position: row[4], team_id: Team.find_by(abbr: row[5].upcase).id)
end
