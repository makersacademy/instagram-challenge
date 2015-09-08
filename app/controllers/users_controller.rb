require 'set'

class UsersController < ApplicationController
  def show
    @user = current_user
    @user_photos = Photo.where(user_id: params[:id])
  end
end
