class LeaguesController < ApplicationController
  def index
    leaguesAll = League.all
    # leaguesPopular = League.leaguePopular
    # leaguesWorld = League.leagueWorld
    # leagueCountryListPopular = League.leagueCountryListPopular
    # leagueCountryListRest = League.leagueCountryListRest

    render json: { 
      all: leaguesAll,
      # popular: leaguesPopular,
      # world: leaguesWorld,
      # countryListPopular: leagueCountryListPopular,
      # countryList: leagueCountryListRest
    }
  end
end
