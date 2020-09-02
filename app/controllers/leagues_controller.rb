class LeaguesController < ApplicationController
  skip_before_action :authorized, only: [:index, :update]

  def index
    leaguesAll = League.all

    render json: { 
      all: leaguesAll
    }
  end

  def update
    league = League.find_by(id: params[:id])

    if league
      league.update(league_params)
      render json: { league: league }
    else
      render json: { message: 'league not found' }
    end
  end

  private

  def league_params
    params.require(:league).permit(:is_favorite)
  end

end
