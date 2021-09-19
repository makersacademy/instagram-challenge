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
  
    private
  
    def user_params
      params
        .require(:user)
        .permit(
          :username,
          :password,
          :password_confirmation,
          :email,
        )
    end
  end
  