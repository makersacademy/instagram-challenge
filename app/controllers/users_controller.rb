class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render file: Rails.public_path.join("templates","SignUp.html")
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in(user)
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/users/new"
    end
  end

  def show
    if logged_in?
      render file: Rails.public_path.join("templates","UserPage.html")
    else
      redirect_to "/users/new"
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
