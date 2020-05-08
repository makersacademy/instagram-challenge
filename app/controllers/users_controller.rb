class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    store_location("/users/#{@user.id}")
    # store_location(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to Instagram"
      # session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
