class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Welcome to Instagram #{@user.name} you are now signed up!"
      redirect_to root_path
    else
      render 'users/new'
    end
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
  end

  def update
    current_user.avatar = params[:user][:picture]
    current_user.save
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
