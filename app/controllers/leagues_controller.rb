class LeaguesController < ApplicationController
  skip_before_action :authorized, only: [:index, :popular, :international]

  def index
    allLeagues = League.all
    render json: allLeagues, except: [:created_at, :updated_at]
  end

  def popular
    popularLeagues = League.leaguePopular
    render json: popularLeagues, except: [:created_at, :updated_at]
  end

  def international
    internationalLeagues = League.leagueInternational
    render json: internationalLeagues, except: [:created_at, :updated_at]

  end

end
