class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @posts = User.find_by(username: params[:username]).posts
  end

  def edit
    @user = User.find_by(username: params[:username])
  end

  def update
    @user = User.find_by(username: params[:username])
    if @user.update(profile_params)
      flash[:success] = 'Your profile has been updated.'
      redirect_to profile_path(@user.username)
    else
      flash[:error] = 'Something is wrong. Try again!'
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end

end
