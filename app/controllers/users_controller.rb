class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show 
    @user = User.find(params[:id])
    @images = @user.images.order('created_at DESC')
  end 
end
