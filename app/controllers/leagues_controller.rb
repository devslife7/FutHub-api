class LeaguesController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    leagues = League.all
    render json: leagues, except: [:created_at, :updated_at]
  end

end
