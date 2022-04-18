# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


UserLeague.destroy_all
UserInvitation.destroy_all
UserWatchparty.destroy_all
Team.destroy_all
Watchparty.destroy_all
Invitation.destroy_all
League.destroy_all
User.destroy_all
Friendship.destroy_all

User.create(name: 'Demo', username: "demo", password: "demo")
User.create(name: 'Marcos', username: "marcos123", password: "password")
User.create(name: 'Andy', username: "andy123", password: "password")
User.create(name: 'Danny', username: "danny123", password: "password")
User.create(name: 'Dave', username: "dave123", password: "password")
User.create(name: 'David', username: "david123", password: "password")
User.create(name: 'Shannon', username: "shannon123", password: "password")
User.create(name: 'Solomon', username: "solomon123", password: "password")
User.create(name: 'Steve', username: "steve123", password: "password")
User.create(name: 'Yoan', username: "yoan123", password: "password")
User.create(name: 'Zara', username: "zara123", password: "password")
User.create(name: 'Catrina', username: "catrina123", password: "password")
User.create(name: 'Daniel', username: "daniel123", password: "password")
User.create(name: 'Diego', username: "diego123", password: "password")
User.create(name: 'Esther', username: "esther123", password: "password")
User.create(name: 'Issa', username: "issa123", password: "password")
User.create(name: 'Kosi', username: "kosi123", password: "password")
User.create(name: 'Paul', username: "paul123", password: "password")
User.create(name: 'PaulsCat', username: "paulscat123", password: "password")
User.create(name: 'Matine', username: "matine123", password: "password")
User.create(name: 'Su', username: "su123", password: "password")
User.create(name: 'Maddie', username: "maddie123", password: "password")
User.create(name: 'MaddiesChild', username: "maddieschild123", password: "password")
User.create(name: 'Steven', username: "steven123", password: "password")
User.create(name: 'EsthersCat', username: "estherscat123", password: "password")
User.create(name: 'AndysDog', username: "andysdog123", password: "password")
User.create(name: 'DanysTooth', username: "DanysTooth123", password: "password")
User.create(name: 'Jordan', username: "Jordan123", password: "password")
User.create(name: 'Luis', username: "luis123", password: "password")
User.create(name: 'Mike', username: "mike123", password: "password")
User.create(name: 'Princeton', username: "princeton123", password: "password")
User.create(name: 'Shawn', username: "shawn123", password: "password")
User.create(name: 'Vidhi', username: "vidhi123", password: "password")
User.create(name: 'Michael', username: "michael123", password: "password")
User.create(name: 'Ian', username: "ian123", password: "password")
User.create(name: 'Tien', username: "tien123", password: "password")
User.create(name: 'Jr', username: "Sr123", password: "password")
User.create(name: 'Matteo', username: "matteo123", password: "password")
User.create(name: 'Mario', username: "mario123", password: "password")
User.create(name: 'Esdras', username: "esdras123", password: "password")
User.create(name: 'Pablo', username: "pablo123", password: "password")
User.create(name: 'Briam', username: "briam123", password: "password")
User.create(name: 'David C', username: "davidc123", password: "password")


def leagues
  headers = {"X-RapidAPI-Key": ENV['API_KEY']}
  url = "https://api-football-v1.p.rapidapi.com/v2/leagues/season/2020"
  response = RestClient::Request.execute(
    :url => url,
    :method => :get,
    :headers => headers,
    :verify_ssl => false
  )
  data = JSON.parse(response)
  
  if !data.nil?
    leagues = data["api"]["leagues"]
    
    leagues.map do |league|
      League.create(
        league_id: league["league_id"],
        name: league["name"],
        league_type: league["type"],
        country: league["country"],
        season: league["season"],
        season_start: league["season_start"],
        season_end: league["season_end"],
        logo: league["logo"],
        flag: league["flag"],
        standings: league["standings"],
        is_current: league["is_current"],
      )
    end
  else
    puts "league data is not valid"
  end
end

def teams
  championsLeagueId = 530

  url = "https://api-football-v1.p.rapidapi.com/v2/teams/league/#{championsLeagueId}"
  headers = {"X-RapidAPI-Key": ENV['API_KEY']}
  response = RestClient::Request.execute(
    :url => url,
    :method => :get,
    :headers => headers,
    :verify_ssl => false
  )
  data = JSON.parse(response)

  teams = data["api"]["teams"]

  teams.map do |team|
    Team.create(
      team_id: team["team_id"],
      name: team["name"],
      logo: team["logo"],
      country: team["country"],
      is_national: team["is_national"],
      founded: team["founded"],
      venue_name: team["venue_name"],
      venue_surface: team["venue_surface"],
      venue_address: team["venue_address"],
      venue_city: team["venue_city"],
      venue_capacity: team["venue_capacity"]
    )
  end
end

teams
leagues

puts "Succesfull Seed!!"