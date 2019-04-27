class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create(extract_params)
    if user.id
      flash[:sign_up_success] = "Congratulations Gran, you're all signed up!"
      redirect_to posts_url
    else
      flash[:sign_up_failure] = "Something wasn't right, try again!"
      redirect_to new_user_url
    end
  end

  private

  def extract_params
    post = params.require(:user)
    { username: post.require(:username),
      email: post.require(:email),
      password: post.require(:password),
      password_confirmation: post.require(:password_confirmation)
    }
  end
end
