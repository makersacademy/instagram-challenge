class UsersController < ApplicationController

  def show
    @posts = current_user.posts.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id]) #finds the current user to edit that profile
  end

  def update
    current_user.update(user_params) #update the current user based on params in form edit
    redirect_to current_user         #goes to private method 
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender)
  end
  #Rails Strong Parameters: we permit these params.  If they aren't permitted, it will be blocked for security

end
