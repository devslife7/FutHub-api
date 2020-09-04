class UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :friends, :signup, :update]

  def index
    users = User.all

    # serializedUsers = users.map do |user|
    #   UserSerializer.new(user)
    # end

    # render json: { users: serializedUsers }
    render json: { users: users }
  end

  def friends
    user = User.find_by(id: params[:id])

    serializedFriends = user.friends.map do |user|
      UserSerializer.new(user)
    end

    render json: { friends: serializedFriends }, status: :accepted
  end
  
  def update
    user = User.find_by( id: params[:id] )
    
    if user
      user.name = update_params[:name]
      user.username = update_params[:username]
      user.save
      # user.update(update_params)
      # byebug
      render json: { user: UserSerializer.new(user) }, status: :accepted
    else
        render json: { error: 'user not found' }, status: :not_acceptable
    end
  end

  def signup
    user = User.new(user_params)

    if user.valid?
      user.save
      render json: { user: UserSerializer.new(user), token: encode_token({ user_id: user.id })}
    else
      render json: { error: user.errors }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

  def update_params
      params.require(:user).permit( :name, :username )
  end

end
