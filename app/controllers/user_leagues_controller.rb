class UserLeaguesController < ApplicationController
  skip_before_action :authorized, only: [:create, :destroy]

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
  
  def destroy
    user_league = UserLeague.find_by( id: params[:id] )
    
    if user_league
      user_league.destroy
      render json: { message: 'Favorite League relationship was succesfully removed' }
    else
      render json: { error: 'Favorite League relationship could not be found' }
    end
  end

  private

  def user_league_params
    params.require(:user_league).permit(:user_id, :league_id)
  end
end
