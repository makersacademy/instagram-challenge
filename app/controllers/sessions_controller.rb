class SessionsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    
    if @user&.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @error = true
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
