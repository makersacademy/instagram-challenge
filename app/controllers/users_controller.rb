class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_images = Image.where(user_id: params[:id]).order(created_at: :asc)
  end
end
