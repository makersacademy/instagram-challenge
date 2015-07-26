class UsersController < ApplicationController

  def show
    @user_images = Image.where(user_id: params[:id]).order(created_at: :asc)
  end

end
