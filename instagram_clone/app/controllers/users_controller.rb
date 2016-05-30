class UsersController < ApplicationController

	before_action :authenticate_user!, only: [:follow, :unfollow]
	
	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end

	def follow
		user = User.find(params[:to_follow_id])
		current_user.follower_relationships.create(followed: user)
		redirect_to request.referer
	end

	def unfollow
		user = User.find(params[:to_unfollow_id])
		current_user.follower_relationships.destroy_where(followed: user)
		redirect_to request.referer
	end

	def following
		@user = User.find(params[:id])
		@users = @user.following
	end

	def followers
		@user = User.find(params[:id])
		@users = @user.followers
	end

end
