class UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :signup, :update]

  def index
    users = User.all
    render json: users,
      except: [:created_at, :updated_at, :password_digest],
      include: [
        :invitations,
        :watchparties,
        :friends,
        :user_leagues => {
          only: [:id],
          include: [:league]
        }
      ]
  end

  def show
    user = User.find_by( id: params[:id] )

    render json: user,
      except: [:created_at, :updated_at, :password_digest],
      include: [
        :invitations,
        :watchparties,
        :friends => {
          except: [:created_at, :updated_at]
        },
        :user_leagues => {
          only: [:id],
          include: [
            :league => { except: [:created_at, :updated_at] }
          ]
        },
      ]
  end
  
  def update
    user = User.find_by( id: params[:id] )
    
    if user
      user.update(update_params)
      render json: user,
        except: [:created_at, :updated_at, :password_digest],
        include: [
          :invitations,
          :watchparties,
          :friends,
          :user_leagues => {
            only: [:id],
            include: [
              :league => { except: [:created_at, :updated_at] }
            ]
          }]
    else
      render json: { error: 'user not found' }
    end
  end

  def signup
    user = User.new(user_params)

    if user.valid?
      user.save
      token = encode_token({ user_id: user.id })

      render json: { user: user, token: token },
        except: [:created_at, :updated_at, :password_digest],
        include: [
          :invitations,
          :watchparties,
          :friends,
          :user_leagues => {
            only: [:id],
            include: [
              :league => { except: [:created_at, :updated_at] }
            ]
          }]
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
