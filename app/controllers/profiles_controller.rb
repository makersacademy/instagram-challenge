class ProfilesController < ApplicationController

  def index
    @user = current_user
    @pictures = Picture.all.where(user_id: current_user.id)
  end

end
