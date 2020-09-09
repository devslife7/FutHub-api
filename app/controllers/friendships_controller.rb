class FriendshipsController < ApplicationController
  skip_before_action :authorized, only: [:create, :remove]

  def create
    user = User.find_by(id: friendship_params[:user_id])
    friend = User.find_by(id: friendship_params[:friend_id])  

    if user.friends.include?(friend)
      render json: { error: 'friendship already exists in the database'}
    else
      friendship = user.friendships.build(friend_id: friend.id)
      friendship2 = friend.friendships.build(friend_id: user.id)

      if friendship.save && friendship2.save
        render json: friend, except: [:created_at, :updated_at, :password_digest]
      else
        render json: { error: 'friendship could not be saved'}
      end
    end
  end

  def remove
    userId = friendship_params[:user_id]
    friendId = friendship_params[:friend_id]

    friendship1 = Friendship.all.find { |rel| rel.user_id === userId && rel.friend_id === friendId }
    friendship2 = Friendship.all.find { |rel| rel.user_id === friendId && rel.friend_id === userId }

    if friendship1 && friendship2
      friendship1.destroy
      friendship2.destroy

      render json: { message: "Friend relationship was removed" }
    else
      render json: { error: "Friend relationships could not be found"}
    end
    
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end

end
