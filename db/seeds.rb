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

# Creates default users
users = [
  "Guest", "Marcos", "Andy", "Danny", "Dave", "David", "Shannon", "Solomon",
  "Steve", "Yoan", "Zara", "Catrina", "Daniel", "Diego", "Esther", "Issa",
  "Kosi", "Paul", "Matine", "Su", "Maddie", "Steven", "Jordan", "Luis",
  "Mike", "Princeton", "Shawn", "Vidhi", "Michael", "Ian", "Tien", "Jr",
  "Matteo", "Mario", "Esdras", "Pablo", "Briam", "Naod", "Gabriel",
]

users.each do |user|
  name = user.capitalize
  username = "#{user.downcase}123"
  password = "password"

  User.create(name: name, username: username, password: password)
end

# Fetches leagues info from api and stores them in database
def leagues
  headers = { "X-RapidAPI-Key": ENV["API_KEY"] }
  url = "https://api-football-v1.p.rapidapi.com/v2/leagues/season/2020"
  response = RestClient::Request.execute(
    :url => url,
    :method => :get,
    :headers => headers,
    :verify_ssl => false,
  )
  data = JSON.parse(response)

  if !data.nil?
    leagues = data["api"]["leagues"]

    leagues.each do |league|
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
  headers = { "X-RapidAPI-Key": ENV["API_KEY"] }
  response = RestClient::Request.execute(
    :url => url,
    :method => :get,
    :headers => headers,
    :verify_ssl => false,
  )
  data = JSON.parse(response)

  teams = data["api"]["teams"]

  teams.each do |team|
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
      venue_capacity: team["venue_capacity"],
    )
  end
end

teams
leagues

puts "Succesfull Seed!!"
