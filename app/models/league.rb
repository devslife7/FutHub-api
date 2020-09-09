class League < ApplicationRecord

  has_many :user_leagues
  has_many :user, :through => :user_leagues

  @popular_countries = ['Spain', 'USA', 'England', 'Germany', 'Italy', 'France', 'Brazil', 'Mexico']

  def self.leaguePopular
    # popular_league_ids = [530, 775, 294, 524, 754, 891, 514, 525, 584]
    # popular_league_ids = [885, 941, 585, 901, 869, 964, 890, 780, 773]
    popular_league_ids = [2771, 2833, 1264, 2790, 2755, 2857, 2777, 2664, 2656]
    self.all.select { |league| popular_league_ids.include?(league.league_id) }
  end

  def self.leagueInternational
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
