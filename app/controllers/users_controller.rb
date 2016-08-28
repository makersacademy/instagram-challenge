class UsersController < ApplicationController

  def index
    if current_user
      @user = current_user
      redirect_to "/users/#{current_user.id}/pictures"
    else
      render 'index'
    end
  end

end
