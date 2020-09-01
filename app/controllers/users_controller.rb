class UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :signup]

  def index
    users = User.all

    serializedUsers = users.map do |user|
      UserSerializer.new(user)
    end

    render json: { users: serializedUsers }
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

end
