class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.create(user_params)
      if @user.save
        redirect_to '/', notice: 'User created :D'
      else
        render 'new'
      end
    end
  
    def upload_avatar
        @add_avatar = current_user.avatar.attach(avatar_params)
        redirect_to '/userpage'
    end
    
    private
  
    def user_params
      params
        .require(:user)
        .permit(
          :username,
          :password,
          :password_confirmation,
          :email,
          :avatar
        )
    end

    def avatar_params
        params
        .require(:user).permit(:avatar, :user_id)

    end
  end
  