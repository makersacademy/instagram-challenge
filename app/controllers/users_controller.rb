class UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(params[:id])
  end
end
