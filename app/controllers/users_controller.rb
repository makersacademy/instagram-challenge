class UsersController < ApplicationController

  # access to a new user instance
  def new
    @user = User.new
  end

  # creating
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_url # this was the root_path, changed to get to posts
    else 
      redirect_to action: "new"  
    end
  end

  # show current user
  def show
    @user = User.find(params[id])
  end

  #strong params? Action controller params 
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
