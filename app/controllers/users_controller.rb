class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = 'You have signed up'
      redirect_to root_path
    else
      flash[:notice] = 'Passwords do not match'
      redirect_to new_user_path
    end
  end

  def show
    if session[:user_id].nil?
      redirect_to root_path
    else
      @user = User.find(session[:user_id])
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def signed_out_redirect
      redirect_to root_path if session[:user_id].nil?
  end
end
