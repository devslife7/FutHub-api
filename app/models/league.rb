class League < ApplicationRecord

  @popular_countries = ['Spain', 'USA', 'England', 'Germany', 'Italy', 'France', 'Brazil', 'Mexico']

  def self.leaguePopular
    popular_league_ids = [530, 775, 294, 524, 754, 891, 514, 525]
    self.all.select { |league| popular_league_ids.include?(league.league_id) }
  end

  def self.leagueWorld
    self.all.select { |league| league.country === "World" }
  end

  def self.leagueCountryListPopular
    countryList = self.all.map { |league| { name: league.country, flag: league.flag } }.uniq
    countryList.filter { |country| @popular_countries.include?(country[:name]) }
  end

  def self.leagueCountryListRest
    popular_countries = ['Spain', 'USA', 'England', 'Germany', 'Italy', 'France', 'Brazil', 'Mexico', 'World']
    countryList = self.all.map { |league| { name: league.country, flag: league.flag } }.uniq
    countryList.filter{ |country| !popular_countries.include?(country[:name]) }
  end

end
