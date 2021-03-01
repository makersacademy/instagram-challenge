class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @images = @user.images.order(created_at: :desc)
  end
end