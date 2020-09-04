class AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]

  def login
    user = User.find_by(username: login_params[:username])
      if user && user.authenticate(login_params[:password])
        token = encode_token({ user_id: user.id })
        
        render json: { user: user, token: token }, except: [:created_at, :updated_at, :password_digest]
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end
end
