class WatchpartiesController < ApplicationController
  skip_before_action :authorized, only: [:create, :show, :update, :destroy]

  def create
    watchparty = Watchparty.new(watchparties_params)
    user = User.find_by(id: params[:user_id])
    friend_ids = params["friend_ids"]

    if watchparty && user
      watchparty.save
      user.watchparties << watchparty

      # byebug

      invitation = Invitation.create(
        sender: watchparties_params[:creator_name],
        location: watchparties_params[:location],
        time: watchparties_params[:time],
        watchparty_id: watchparty.id,
        timestamp: watchparties_params[:timestamp],
        home_team_name: watchparties_params[:home_team_name],
        home_team_logo: watchparties_params[:home_team_logo],
        away_team_name: watchparties_params[:away_team_name],
        away_team_logo: watchparties_params[:away_team_logo]
      )

      friend_ids.map do |id|
        friend = User.find_by(id: id)
        friend.invitations << invitation
      end

      render json: watchparty
    else
      render json: { message: 'party could not be created' }
    end
  end

  def show
    wp = Watchparty.find_by(id: params[:id])

    if wp
      render json: wp
    else
      render json: { message: 'party could not be found'}
    end
  end

  def update
    watchparty = Watchparty.find_by(id: params[:id])

    if watchparty
      watchparty.update(update_params)
      render json: watchparty
    else
      render json: { error: 'Watch party could not be found'}
    end
  end

  def destroy
    watchparty = Watchparty.find_by(id: params[:id])
    if watchparty
      watchparty.destroy
      render json: { message: 'watchparty was deleted' }
    else
      render json: { message: 'watchparty could not be found' }
    end
  end

  private

  def watchparties_params
    params.require(:watchparty).permit(:name, :time, :timestamp, :location, :creator_name, :league_name, :league_logo, :home_team_name, :home_team_logo, :away_team_name, :away_team_logo)
  end

  def update_params
    params.require(:watchparty).permit(:name, :time, :location)
  end
end
