class MainController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to homepage_path, notice: "Logged in successfully"
    else
      # flash[:alert] = "Invalid email or password"
      # render :index, notice: "Invalid email or password"
      redirect_to root_path, notice: "Invalid email or password"
    end
  end
end