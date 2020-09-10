class UserWatchpartiesController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.find_by(id: user_watchparties_params[:user_id])
    watchparty = Watchparty.find_by(id: user_watchparties_params[:watchparty_id])
    
    if user && watchparty
      userWatchparty = UserWatchparty.new(user_watchparties_params)
      if userWatchparty
        userWatchparty.save
        render json: { watchparty: watchparty }
      else
        render json: { error: 'UserWatchparties could not be saved'}
      end
    else
      render json: { error: 'User or Watchparty could not be found'}
    end

  end

  private

  def user_watchparties_params
    params.require(:user_watchparty).permit(:user_id, :watchparty_id)
  end
end
