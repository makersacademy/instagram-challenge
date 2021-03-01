class InztagramController < ApplicationController
  def index
    # flash[:notice] = "Logged in successfully"
    # flash[:alert] = "Invalid email or password"
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end
end
