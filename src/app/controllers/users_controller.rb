class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @existing_user = User.find_by_email(params[:user]['email'])
    if @existing_user.nil?
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to pictures_url
    else
      flash[:alert] = "This e-mail is already in use"
      redirect_to '/users/new'
    end
  end
 
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
