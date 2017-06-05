class UsersController < ApplicationController

 before_action :authenticate_user!

  def index
    redirect_to users_show
  end

 def show
   @user = User.find(params[:id])
  end

end
