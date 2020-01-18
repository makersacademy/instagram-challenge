class UsersController < ApplicationController
  def new; end

  def create
    new_user = User.new user_params

    if new_user.save
      session[:id] = new_user.id
      redirect_to "/users/#{session[:id]}"
    end
  end

  def show
    @user = User.find(session[:id])
    @user_posts = Post.where({ user_id: @user.id })
  end

  private

  def user_params
    {
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    }
  end
end
