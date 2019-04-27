class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create(extract_sign_up_params)
    if user.id
      flash[:sign_up_success] = true
      redirect_to posts_url
    else
      flash[:failure] = true
      redirect_to new_user_url
    end
  end

  private

  def extract_sign_up_params
    post = params.require(:user)
    { username: post.require(:username),
      email: post.require(:email),
      password: post.require(:password),
      password_confirmation: post.require(:password_confirmation)
    }
  end
end
