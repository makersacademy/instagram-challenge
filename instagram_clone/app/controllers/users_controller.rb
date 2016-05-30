class UsersController < ApplicationController

	before_action :authenticate_user!, only: [:follow]
	
	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end

	def follow
		user = User.find(params[:to_follow_id])
		current_user.follower_relationships.create(followed: user)
		redirect_to users_path
	end

end
