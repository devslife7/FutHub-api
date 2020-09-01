class LeaguesController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    leaguesAll = League.all

    render json: { 
      all: leaguesAll
    }
  end
end
