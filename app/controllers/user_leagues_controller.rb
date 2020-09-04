class UserLeaguesController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.find_by(id: user_league_params[:user_id])
    league = League.find_by(id: user_league_params[:league_id])

    if user.leagues.include?(league)
      render json: { error: 'Relationship already exists'}
    else
      favorite = UserLeague.new(
        user_id: user_league_params[:user_id],
        league_id: user_league_params[:league_id]
      )
      
      if favorite.save
        render json: { message: 'Relationship was succesfully saved to the database'}
      else
        render json: { error: 'Relationship could not be saved'}
      end
    end
  end
  
  # def destroy

  # end

  private

  def user_league_params
    params.require(:user_league).permit(:user_id, :league_id)
  end
end
