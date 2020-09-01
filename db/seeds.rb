# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


League.destroy_all

def leagues
  headers = {"X-RapidAPI-Key": "f1b01111bamsh60c54da50b0a770p1059c7jsn4c82133f9b38"}
  data = JSON.parse(RestClient.get("https://api-football-v1.p.rapidapi.com/v2/leagues/season/2019", headers))
  
  if !data.nil?
    leagues = data["api"]["leagues"]
    
    leagues.map do |league|
      # puts league["type"]
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
        is_current: league["is_current"]
      )
    end
  else
    puts "league data is null"
  end
end

leagues