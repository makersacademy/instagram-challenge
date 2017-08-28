class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
    @users = User.all
    @user = User.find(params[:id])
  end
end
