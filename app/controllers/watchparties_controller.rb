class WatchpartiesController < ApplicationController
  skip_before_action :authorized, only: [:create, :destroy]

  def create
    watchparty = Watchparty.new(watchparties_params)
    user = User.find_by(id: params[:user_id])
    friend_ids = params["friend_ids"]

    if watchparty && user
      watchparty.save
      user.watchparties << watchparty

      invitation = Invitation.create(
        sender: watchparties_params[:creator_name],
        location: watchparties_params[:location],
        time: watchparties_params[:time]
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
    params.require(:watchparty).permit(:name, :time, :location, :creator_name)
  end
end
