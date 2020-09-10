class UserInvitationsController < ApplicationController
  skip_before_action :authorized, only: [:remove]

  def remove
    userId = params[:user_id]
    invitationId = params[:invitation_id]

    user_invitation = UserInvitation.all.find { |rel| rel.user_id === userId && rel.invitation_id === invitationId }

    if user_invitation
      user_invitation.destroy

      render json: { message: "user invitation relationship was removed" }
    else
      render json: { error: "user invitation relationships could not be found"}
    end
    
  end


end
