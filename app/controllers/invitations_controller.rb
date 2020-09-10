class InvitationsController < ApplicationController
  skip_before_action :authorized, only: [:destroy]

  def destroy
    inv = Invitation.find_by(id: params[:id])
    if inv
      inv.destroy
      render json: { message: 'invitation destroyed succesfully'}
    else
      render json: { error: 'could not find invitation'}
    end
  end
end
